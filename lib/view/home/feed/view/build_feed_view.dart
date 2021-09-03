import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_widgets/card/build_user_card.dart';
import '../model/house_model.dart';
import '../viewmodel/build_feed_view_model.dart';
import 'package:kartal/kartal.dart';

class BuildFeedView extends StatelessWidget {
  const BuildFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewModel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getListAll();
      },
      onPageBuilder: (BuildContext context, BuildFeedViewModel viewModel) =>
          Scaffold(
        key: viewModel.scaffoldKey,
        appBar: buildAppBar(),
        body: DefaultTabController(
            length: 4,
            child: Observer(builder: (_) {
              return viewModel.isLoading
                  ? buildCenterLoading()
                  : viewModel.houseModels == null ||
                          viewModel.houseModels!.isEmpty
                      ? Center(
                          child: Text('Not Found'),
                        )
                      : buildListViewRecommended(viewModel, context);
            })),
      ),
    );
  }

  ListView buildListViewRecommended(
      BuildFeedViewModel viewModel, BuildContext context) {
    return ListView(
      padding: context.paddingNormal,
      children: [
        buildTabBar(viewModel, context),
        buildSizedBoxLatestPageView(context, viewModel),
        Text(
          LocaleKeys.home_build_subTitle.locale,
          style: context.textTheme.headline5!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        buildListViewRecommendedBottom(viewModel)
      ],
    );
  }

  ListView buildListViewRecommendedBottom(BuildFeedViewModel viewModel) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SizedBox(
        height: context.dynamicHeight(0.2),
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.network(
                  viewModel.houseModels![index].image!,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                  flex: 9,
                  child: Container(
                    margin: EdgeInsets.only(left: context.lowValue),
                    child: buildObserverUserCard(
                      viewModel.houseModels![index],
                      viewModel,
                    ),
                  )),
            ],
          ),
        ),
      ),
      itemCount: viewModel.houseModels!.length,
      shrinkWrap: true,
    );
  }

  SizedBox buildSizedBoxLatestPageView(
      BuildContext context, BuildFeedViewModel viewModel) {
    return SizedBox(
      height: context.dynamicHeight(0.45),
      child: PageView.builder(
          controller: PageController(viewportFraction: .95),
          itemCount: 3,
          itemBuilder: (context, index) => buildStackFloaty(
                context,
                viewModel.sliderHouse,
                viewModel,
              )),
    );
  }

  TabBar buildTabBar(BuildFeedViewModel viewModel, BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicator:
          viewModel.helper!.circleDecoration(context.colorScheme.surface),
      tabs: [
        Tab(
          text: LocaleKeys.home_build_tabbar_tab1.locale,
        ),
        Tab(
          text: LocaleKeys.home_build_tabbar_tab2.locale,
        ),
        Tab(
          text: LocaleKeys.home_build_tabbar_tab3.locale,
        ),
        Tab(
          text: LocaleKeys.home_build_tabbar_tab4.locale,
        ),
      ],
    );
  }

  Center buildCenterLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.format_align_left),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildStackFloaty(
      BuildContext context, HouseModel model, BuildFeedViewModel viewModel) {
    return Padding(
      padding: context.paddingLow,
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 100,
            child: Image.network(
              model.image!,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 150,
            left: 10,
            right: 10,
            child: Card(
              child: Padding(
                padding: context.paddingLow,
                child: buildObserverUserCard(model, viewModel),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Observer buildObserverUserCard(
      HouseModel model, BuildFeedViewModel viewModel) {
    return Observer(builder: (_) {
      return BuildUserCard(
        model: model,
        isLiked: viewModel.likedItems.contains(model.id),
        onPressedLikeId: (id) {
          viewModel.onLikeItemPressed(id!);
        },
      );
    });
  }
}
