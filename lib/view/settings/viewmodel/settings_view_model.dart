import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_architecture_3/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_architecture_3/core/init/notifier/theme_notifer.dart';
import 'package:mvvm_architecture_3/view/settings/model/settings_dynamic_model.dart';
import 'package:provider/src/provider.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/product/model/user_model.dart';

part 'settings_view_model.g.dart';
part 'subviewmodel/about_view_model.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  UserModel userModel = UserModel.fake();
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    appLocale = context!.deviceLocale;
  }

  @observable
  late Locale appLocale;

  @action
  void changeAppTheme() {
    context!.read<ThemeNotifier>().changeTheme();
  }

  @action
  void changeAppLanguage(Locale? locale) {
    appLocale = locale!;
    context!.setLocale(appLocale);
  }

  Future<void> logoutApp() async {
    await localeManager.clearAllSaveFirst();
    await navigation.navigateToPageClear(path: NavigationConstants.TEST_VIEW);
  }

  Future<void> navigatoOnBoard() async {
    await navigation.navigateToPage(path: NavigationConstants.ON_BOARD);
  }
}
