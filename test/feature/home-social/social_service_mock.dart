import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:mvvm_architecture_3/view/home/social/service/social_service.dart';
import 'package:vexana/src/interface/INetworkService.dart';

class SocialServiceMock extends SocialService {
  SocialServiceMock(
      INetworkManager manager, GlobalKey<ScaffoldState>? scaffoldKey)
      : super(manager, scaffoldKey);
}
