import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../model/social_user_model.dart';
import '../service/ISocialService.dart';
import '../service/social_service.dart';
import 'package:vexana/vexana.dart';

class SocialViewDetail extends StatelessWidget {
  final SocialUserModel? socialUser;

  final INetworkManager manager = VexanaManager.instance.networkManager;
  ISocialService get socialService => SocialService(manager, null);

  SocialViewDetail({Key? key, this.socialUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: socialService.fetchUser(socialUser!.sId).toBuild<SocialUserModel?>(
            onSuccess: (data) {
              return Center(
                child: Image.network(data!.image!),
              );
            },
            loadingWidget: CircularProgressIndicator(),
            notFoundWidget: Center(
              child: Text('Not Found'),
            ),
            onError: Text('error'),
          ),
    );
  }
}
