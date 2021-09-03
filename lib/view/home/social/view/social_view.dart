import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../../../_product/_widgets/animation/social_card_animation.dart';
import '../../../_product/_widgets/list-tile/friend_card.dart';
import '../service/social_service.dart';
import '../viewmodel/social_view_model.dart';

class SocialView extends StatelessWidget {
  SocialView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<SocialViewModel>(
      viewModel: SocialViewModel(
        SocialService(VexanaManager.instance.networkManager, scaffoldKey),
      ),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SocialViewModel viewModel) =>
          Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: context.paddingLowHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildFindFriendText(context),
              Spacer(flex: 2),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
                onChanged: (value) {
                  viewModel.fetchAllUserSearchQuery(value);
                },
              ),
              Spacer(flex: 2),
              Expanded(
                flex: 90,
                child: Observer(builder: (_) {
                  return buildListViewUser(viewModel);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: TextButton(
        onPressed: () {},
        child: Text(LocaleKeys.home_social_cancel.locale),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          textStyle: context.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.home_social_next.locale,
              style: context.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w600,
                color: Color(0xffFF2D55),
              ),
            ))
      ],
    );
  }

  Text buildFindFriendText(BuildContext context) {
    return Text(
      LocaleKeys.home_social_findFriends.locale,
      style: context.textTheme.headline4!.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colors.onSecondary,
      ),
    );
  }

  ListView buildListViewUser(SocialViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.socialUserList!.length,
      itemBuilder: (context, index) {
        viewModel.fetchAllUserLazy(index);
        return OpenContainerSocailWrapper(
          socialUser: viewModel.socialUserList![index],
          closedBuilder: (BuildContext _, VoidCallback openContainer) {
            return FriendCard(
              user: viewModel.socialUserList![index],
              onPressed: openContainer,
            );
          },
        );
      },
    );
  }
}
