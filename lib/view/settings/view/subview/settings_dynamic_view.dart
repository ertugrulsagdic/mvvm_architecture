import 'package:flutter/material.dart';
import 'package:mvvm_architecture_3/core/constants/app/app_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../model/settings_dynamic_model.dart';

class SettingsDynamicView extends StatelessWidget {
  final SettingsDynamicModel model;

  const SettingsDynamicView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.title,
        ),
      ),
      body: WebView(
        initialUrl: model.url ?? ApplicationConstants.APP_WEB_SITE,
      ),
    );
  }
}
