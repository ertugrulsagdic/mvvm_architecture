import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../../../../core/product/widget/button/header_button.dart';
import '../../../../core/product/widget/grid/game_grid_view.dart';
import '../../../../core/product/widget/pageview/game_slider.dart';
import '../model/game_model.dart';
import '../model/game_view_state.dart';
import '../service/game_service.dart';
import '../viewmodel/game_view_model.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return BaseView<GameViewModel>(
      viewModel: GameViewModel(GameService(
        VexanaManager.instance.networkManager,
        _scaffoldKey,
      )),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, GameViewModel viewModel) =>
          Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(context),
        body: DefaultTabController(
            length: viewModel.gameTabItems.length,
            child: Observer(builder: (_) {
              return viewModel.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: GameViewState.values.length,
                      itemBuilder: (context, index) {
                        switch (GameViewState.values[index]) {
                          case GameViewState.SEARCH_BAR:
                            return buildPaddingSearchBar(context);
                          case GameViewState.TAB_BAR:
                            return buildTabBar(context, viewModel);
                          case GameViewState.SLIDER:
                            return Padding(
                              padding: context.verticalPaddingLow,
                              child: SizedBox(
                                  height: context.dynamicHeight(0.3),
                                  child: GameSlider(
                                      sliderModel: viewModel.sliderItems)),
                            );
                          case GameViewState.NEW_UPDATE_GAMES_CARD:
                            return buildColumnGameNewCard(viewModel);
                          case GameViewState.TOP_UPDATE_GAMES_CARD:
                            return buildColumnGameTopCard(viewModel);
                          default:
                            throw Exception('STATE DOES NOT FOUND!');
                        }
                      },
                    );
            })),
      ),
    );
  }

  Widget buildColumnGameNewCard(GameViewModel viewModel) {
    return Column(
      children: [
        HeaderButton(
          titleText: LocaleKeys.home_game_newUpdate.tr(),
        ),
        viewModel.onNewGameItems().toBuild<List<GameModel>>(
              onSuccess: (data) {
                return GameGrid(
                  models: data,
                );
              },
              loadingWidget: Center(child: CircularProgressIndicator()),
              notFoundWidget: Text('Not Found'),
              onError: Text('Error'),
            )
      ],
    );
  }

  Widget buildColumnGameTopCard(GameViewModel viewModel) {
    return Column(
      children: [
        HeaderButton(
          titleText: LocaleKeys.home_game_topDownload.tr(),
        ),
        viewModel.onTopGameItems().toBuild<List<GameModel>>(
              onSuccess: (data) {
                return GameGrid(
                  models: data,
                );
              },
              loadingWidget: Center(child: CircularProgressIndicator()),
              notFoundWidget: Text('Not Found'),
              onError: Text('Error'),
            )
      ],
    );
  }

  TabBar buildTabBar(BuildContext context, GameViewModel viewModel) {
    return TabBar(
      indicatorColor: context.colorScheme.onError,
      isScrollable: true,
      labelStyle: context.textTheme.subtitle1,
      labelColor: context.colorScheme.onError,
      labelPadding: context.horizontalPaddingNormal,
      unselectedLabelColor: context.colorScheme.primary,
      tabs: viewModel.gameTabItems
          .map(
            (tab) => Tab(
              text: tab.tr(),
            ),
          )
          .toList(),
    );
  }

  Padding buildPaddingSearchBar(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.qr_code_rounded),
        onPressed: () {},
      ),
      title: Text(
        LocaleKeys.home_game_title.tr(),
        style: context.textTheme.headline5!.apply(
          color: context.colorScheme.onError,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {},
        )
      ],
    );
  }
}
