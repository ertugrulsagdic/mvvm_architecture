import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_response_model.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../model/login_model.dart';
import '../service/ILoginService.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  ILoginService? loginService;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    loginService = LoginService(VexanaManager.instance.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  Future<void> fetchLoginService() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await loginService!.fetchUserControl(LoginModel(
          email: emailController!.text, password: passwordController!.text));
      response!.toJson();
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(
        response.message.toString(),
      )));

      print('#################response.data###########');
      print(response.data);

      isLoadingChange();

      if (response.status == true) {
        // final model = _responseParser<LoginResponseModel, LoginResponseModel>(
        //     LoginResponseModel(), response.data);

        await localeManager.setStringValue(
          PreferencesKeys.TOKEN,
          response.data!.token ?? '',
        );
        await navigation.navigateToPage(path: NavigationConstants.TEST_VIEW);
      }
    }
  }

  R? _responseParser<R, T>(BaseResponseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, dynamic>) as R;
    }
    return data as R?;
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
