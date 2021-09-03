import 'package:flutter/material.dart';

import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../home/social/model/social_user_model.dart';

class FriendCard extends StatelessWidget {
  final SocialUserModel? user;
  final VoidCallback? onPressed;

  const FriendCard({Key? key, this.user, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user!.image!),
      ),
      title: Text(user!.name!),
      subtitle: Text(user!.company!),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xffFF2D55),
        ),
        onPressed: () {},
        child: Text(
          LocaleKeys.home_social_follow.locale,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
