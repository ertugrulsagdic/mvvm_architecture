import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../_product/_model/query/friend_query.dart';
import 'package:vexana/vexana.dart';

import '../model/social_user_model.dart';

abstract class ISocialService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  ISocialService(this.manager, this.scaffoldKey);

  Future<List<SocialUserModel>> fetchUserList(FriendQuery query);
  Future<SocialUserModel?> fetchUser(id);
}
