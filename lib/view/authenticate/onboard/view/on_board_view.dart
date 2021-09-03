import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/components/text/auto_locale_text.dart';
import '../../../_product/_widgets/avatar/on_board_circle.dart';
import '../model/on_board_model.dart';

import '../../../../core/base/view/base_widget.dart';
import '../viewModel/on_board_view_model.dart';
import '../../../../core/extension/context_extension.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context))
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
      itemBuilder: (context, index) =>
          buildColumnBody(context, viewModel.onBoardItems[index]),
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: buildListViewCircles(viewModel),
        ),
        Expanded(child: Center(child: Observer(builder: (_) {
          return Visibility(
            visible: viewModel.isLoading,
            child: CircularProgressIndicator(),
          );
        }))),
        buildButtonSkip(context, viewModel)
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) =>
              OnBoardCircle(isSelected: viewModel.currentIndex == index),
        );
      },
    );
  }

  FloatingActionButton buildButtonSkip(
      BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
      child: Icon(
        Icons.keyboard_arrow_right,
        color: context.colors.primaryVariant,
      ),
      onPressed: () => viewModel.completeToOnBoard(),
      backgroundColor: context.colors.secondaryVariant,
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDecription(context, model),
      ],
    );
  }

  Column buildColumnDecription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        builldAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildAutoLocaleTextDescription(model, context),
        )
      ],
    );
  }

  AutoLocaleText builldAutoLocaleTextTitle(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: context.textTheme.headline3!.copyWith(
          fontWeight: FontWeight.bold, color: context.colors.onSecondary),
    );
  }

  AutoLocaleText buildAutoLocaleTextDescription(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.description,
      textAlign: TextAlign.center,
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }

  SvgPicture buildSvgPicture(String imagePath) => SvgPicture.asset(imagePath);
}
