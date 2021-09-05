import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/src/context_extension.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/components/slider/range_price_slider.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../../../../core/product/widget/card/burger_card.dart';
import '../../../_product/enum/burger_network_enum.dart';
import '../service/burger_service.dart';
import '../viewmodel/burger_view_model.dart';

class BurgerView extends StatelessWidget {
  const BurgerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BurgerViewModel>(
      viewModel:
          BurgerViewModel(BurgerService(VexanaManager.instance.networkManager)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, BurgerViewModel viewModel) =>
          Scaffold(
        appBar: AppBar(
          title: Text(
            'ES Burger',
            style: context.textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onError,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      buildBottomSheetBody(context, viewModel),
                );
              },
              icon: Icon(Icons.filter_alt),
            )
          ],
          leading: Icon(Icons.food_bank),
        ),
        body: Observer(builder: (_) {
          return viewModel.isLoading
              ? buildCenterLoading()
              : Padding(
                  padding: context.paddingLow,
                  child: ListView.builder(
                    itemCount: _BurgerViewStates.values.length,
                    itemBuilder: (context, index) {
                      final _views = _BurgerViewStates.values[index];
                      switch (_views) {
                        case _BurgerViewStates.BESTSELLER_TITLE:
                          return buildTextTitle(
                            context,
                            LocaleKeys.home_burgers_favoriteProducts.tr(),
                          );
                        case _BurgerViewStates.FAVORITE_BURGERS:
                          return SizedBox(
                            height: context.dynamicHeight(0.33),
                            child: BurgerCard()
                                .buildList(viewModel.favoriteBurgers),
                          );
                        case _BurgerViewStates.MAIN_TITLE:
                          return buildTextTitle(
                            context,
                            LocaleKeys.home_burgers_normalProducts.tr(),
                          );
                        case _BurgerViewStates.MAIN_BURGERS:
                          viewModel.fetchBurgers();
                          return Observer(
                            builder: (_) {
                              return viewModel.isLoadingMain
                                  ? SizedBox(
                                      height: context.dynamicHeight(0.1),
                                      child: buildCenterLoading(),
                                    )
                                  : GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemCount: viewModel.mainBurgers.length,
                                      itemBuilder: (context, index) {
                                        return BurgerCard(
                                          model: viewModel.mainBurgers[index],
                                        );
                                      },
                                    );
                            },
                          );
                      }
                    },
                  ),
                );
        }),
      ),
    );
  }

  Widget buildBottomSheetBody(
          BuildContext context, BurgerViewModel viewModel) =>
      Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filters',
              style: context.textTheme.headline5,
            ),
            Divider(
              height: 2,
              thickness: 2,
            ),
            Row(
              children: [
                Expanded(
                  child: RangePriceSlider(
                    min: 10,
                    max: 50,
                    onCompleted: (values) {
                      viewModel.changeRangeValues(values);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    viewModel.fetchMinMax();
                  },
                  icon: Icon(Icons.check_box_outline_blank),
                )
              ],
            ),
            Card(
              child: Column(
                children: [
                  Wrap(
                    spacing: 10,
                    children: BurgerSortValues.values
                        .map((e) => TextButton(
                            onPressed: () {
                              viewModel.fetchSort(e);
                            },
                            child: Text(e.rawValue)))
                        .toList(),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => viewModel.changeAscanding(true),
                        icon: Icon(Icons.plus_one),
                      ),
                      IconButton(
                          onPressed: () => viewModel.changeAscanding(false),
                          icon: Icon(Icons.exposure_minus_1)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Center buildCenterLoading() =>
      Center(child: CircularProgressIndicator.adaptive());

  Text buildTextTitle(BuildContext context, String title) {
    return Text(
      title,
      style: context.textTheme.headline2!
          .copyWith(color: context.colorScheme.onSecondary),
    );
  }
}

enum _BurgerViewStates {
  BESTSELLER_TITLE,
  FAVORITE_BURGERS,
  MAIN_TITLE,
  MAIN_BURGERS
}
