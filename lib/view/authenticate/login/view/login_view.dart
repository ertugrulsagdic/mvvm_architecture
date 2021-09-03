import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/image/image_constatns.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/base/view/base_widget.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
          DefaultTabController(
        length: 2,
        child: Scaffold(
          key: viewModel.scaffoldState,
          body: Column(
            children: [
              SafeArea(
                  child: Column(
                children: [
                  buildAnimatedContainer(context),
                  buildContainerTabBar(context),
                ],
              )),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: context.paddingNormal,
                    child: buildForm(viewModel, context),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: context.lowDuration,
      height:
          context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      color: Colors.white,
      child: Center(child: Image.asset(ImageConstants.instance.hotDog)),
    );
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Padding(
        padding: context.paddingHighHorizontal,
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      labelStyle: context.textTheme.headline5,
      unselectedLabelStyle: context.textTheme.headline5,
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.yellow,
      indicatorWeight: 5,
      tabs: [
        Tab(
          text: '  ${LocaleKeys.login_tab1.locale}  ',
        ),
        Tab(
          text: '  ${LocaleKeys.login_tab2.locale}  ',
        ),
      ],
    );
  }

  Form buildForm(LoginViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.formState,
      child: Column(
        children: [
          Spacer(flex: 6),
          buildTextFormFieldEmail(context, viewModel),
          Spacer(),
          buildTextFormFieldPassword(context, viewModel),
          Spacer(),
          buildForgotText(),
          Spacer(flex: 6),
          buildLoginButton(context, viewModel),
          buildWrapSignUpText(),
          Spacer(),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldEmail(
      BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        labelText: LocaleKeys.login_email.locale,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      color: context.colors.onError,
      child: Icon(icon, color: context.colors.primaryVariant),
      padding: context.paddingLow,
    );
  }

  Observer buildTextFormFieldPassword(
      BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        obscureText: viewModel.isLockOpen,
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            labelText: LocaleKeys.login_password.locale,
            icon: buildContainerIconField(context, Icons.vpn_key),
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                viewModel.isLockStateChange();
              },
              icon: Observer(builder: (_) {
                return Icon(
                    viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
              }),
            )),
      );
    });
  }

  Align buildForgotText() => Align(
      alignment: Alignment.centerRight,
      child: Text(LocaleKeys.login_forgotText.locale));

  Widget buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              context.paddingNormal),
          backgroundColor:
              MaterialStateProperty.all<Color>(context.colors.onError),
        ),
        onPressed: viewModel.isLoading
            ? () {
                viewModel.fetchLoginService();
              }
            : () {
                viewModel.fetchLoginService();
              },
        child: Center(
            child: Text(
          LocaleKeys.login_login.locale,
          style: context.textTheme.headline5,
        )),
      );
    });
  }

  Wrap buildWrapSignUpText() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(LocaleKeys.login_dontAccount.locale),
        TextButton(onPressed: () {}, child: Text(LocaleKeys.login_tab2.locale))
      ],
    );
  }
}
