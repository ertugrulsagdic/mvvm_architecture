part of '../settings_view_model.dart';

extension SettingsViewModelBaseNavigation on _SettingsViewModelBase {
  void navigateToContribution() {
    navigation.navigateToPage(
      path: NavigationConstants.SETTINGS_WEB_VIEW,
      data: SettingsDynamicModel.fake(),
    );
  }

  void navigateToFakeContribution() {
    navigation.navigateToPage(
      path: NavigationConstants.SETTINGS_WEB_VIEW,
      data: SettingsDynamicModel.fakeNull(),
    );
  }
}
