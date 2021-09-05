class SettingsDynamicModel {
  final String title;
  final String? url;

  SettingsDynamicModel(this.title, {this.url});

  factory SettingsDynamicModel.fake() {
    return SettingsDynamicModel(
      'Project Contributers',
      url:
          'https://github.com/ertugrulsagdic/mvvm_architecture/graphs/contributors',
    );
  }

  factory SettingsDynamicModel.fakeNull() {
    return SettingsDynamicModel(
      'Project Contributers',
    );
  }
}
