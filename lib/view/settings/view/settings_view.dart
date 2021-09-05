import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:mvvm_architecture_3/core/constants/enums/app_theme_enum.dart';
import 'package:mvvm_architecture_3/core/init/lang/language_manager.dart';
import 'package:mvvm_architecture_3/core/init/notifier/theme_notifer.dart';
import 'package:mvvm_architecture_3/view/_product/enum/lottie_path_enum.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/extension/widget_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SettingsViewModel viewModel) =>
          Scaffold(
        body: Padding(
          padding: context.paddingLow,
          child: CustomScrollView(
            slivers: [
              buildSliverAppBar(context),
              context.emptySizedHeightBoxLow.toSliver,
              buildCardUser(context, viewModel).toSliver,
              context.emptySizedHeightBoxLow.toSliver,
              buildCardHeaderProjectCore(context, viewModel).toSliver,
              context.emptySizedHeightBoxLow.toSliver,
              buildCardApplicationTour(viewModel).toSliver,
              context.emptySizedHeightBoxLow.toSliver,
              buildCardAbout(context, viewModel).toSliver,
              context.emptySizedHeightBoxLow.toSliver,
              buildLogoutButton(viewModel, context).toSliver,
              context.emptySizedHeightBoxLow.toSliver,
              Text(
                '${''.version}',
                textAlign: TextAlign.center,
                style: context.textTheme.headline6
                    ?.copyWith(fontWeight: FontWeight.w100),
              ).toSliver,
              context.emptySizedHeightBoxLow.toSliver,
            ],
          ),
        ),
      ),
    );
  }

  Card buildCardApplicationTour(SettingsViewModel viewModel) {
    return Card(
      child: ListTile(
        title: Text(LocaleKeys.settings_applicationTour.tr()),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: viewModel.navigatoOnBoard,
      ),
    );
  }

  Widget buildCardHeaderProjectCore(
      BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(
      context,
      viewModel,
      title: LocaleKeys.settings_core_title,
      children: [
        ListTile(
          leading: Icon(Icons.invert_colors),
          title: Text(LocaleKeys.settings_core_themeTitle.tr()),
          subtitle: Text(LocaleKeys.settings_core_themeDesc.tr()),
          trailing: IconButton(
            icon: context.watch<ThemeNotifier>().currentThemeEnum ==
                    AppThemes.LIGHT
                ? LottiePathEnum.MOON.toWidget
                : LottiePathEnum.SUNNY.toWidget,
            onPressed: viewModel.changeAppTheme,
          ),
        ),
        ListTile(
          leading: Icon(Icons.invert_colors),
          title: Text(LocaleKeys.settings_core_langTitle.tr()),
          subtitle: Text(LocaleKeys.settings_core_langDesc.tr()),
          trailing: Observer(builder: (_) {
            return DropdownButton<Locale>(
              items: [
                DropdownMenuItem(
                  child: Text(LanguageManager.instance.trLocale.countryCode!
                      .toUpperCase()),
                  value: LanguageManager.instance.trLocale,
                ),
                DropdownMenuItem(
                  child: Text(LanguageManager.instance.enLocale.countryCode!
                      .toUpperCase()),
                  value: LanguageManager.instance.enLocale,
                ),
              ],
              onChanged: viewModel.changeAppLanguage,
              value: viewModel.appLocale,
            );
          }),
        ),
      ],
    );
  }

  TextButton buildLogoutButton(
      SettingsViewModel viewModel, BuildContext context) {
    return TextButton.icon(
      onPressed: viewModel.logoutApp,
      icon: Icon(Icons.exit_to_app),
      label: Text(LocaleKeys.settings_exit.tr()),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.colorScheme.onError),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
    );
  }

  Widget buildCardHeader(
    BuildContext context,
    SettingsViewModel viewModel, {
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.paddingLow,
            child: Text(
              title.tr(),
              style: context.textTheme.headline5,
            ),
          ),
          Divider(),
          ...children
        ],
      ),
    );
  }

  Widget buildCardAbout(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(
      context,
      viewModel,
      title: LocaleKeys.settings_about_title,
      children: [
        ListTile(
          onTap: viewModel.navigateToContribution,
          leading: Icon(Icons.favorite),
          title: Text(LocaleKeys.settings_about_contribitions.tr()),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
        ),
        ListTile(
          onTap: viewModel.navigateToFakeContribution,
          leading: Icon(Icons.home),
          title: Text(LocaleKeys.settings_about_title.tr()),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
        )
      ],
    );
  }

  Card buildCardUser(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      child: Padding(
        padding: context.paddingNormal,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Text(viewModel.userModel.shortName),
            ),
            Spacer(),
            Text(viewModel.userModel.fullName),
            Spacer(flex: 6),
          ],
        ),
      ),
    );
  }

  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          buildSliverAppBar(context),
        ];
      },
      body: Text('data'),
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      backgroundColor: context.colorScheme.background,
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(
          LocaleKeys.settings_title.tr(),
          style: context.textTheme.headline5,
        ),
      ),
    );
  }
}
