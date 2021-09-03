import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/init/cache/locale_manager.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/app_theme_enum.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/init/notifier/theme_notifer.dart';
import '../model/test_model.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() async {
    token = await LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN);
  }

  @observable
  bool isLoading = false;

  @observable
  String? token;

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context!, listen: false)
        .changeValue(AppThemes.DARK);
  }
}

// BEFORE: null safety
// final response = await coreDio.fetch<List<TestModel>, TestModel>("x", type: HttpTypes.GET, parseModel: TestModel());
