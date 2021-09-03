import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../_product/_model/query/friend_query.dart';
import '../../../_product/_utility/throttle_helper.dart';
import '../model/social_user_model.dart';
import '../service/ISocialService.dart';

part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  _SocialViewModelBase(this._socialService);

  @override
  void setContext(BuildContext context) => this.context = context;

  final ISocialService? _socialService;

  @override
  void init() {
    _fetchAllUser();
    _throttleHelper = ThrottleHelper();
  }

  ThrottleHelper? _throttleHelper;

  String _query = '';

  int _page = 0;
  bool isLazyLoadataFinish = false;

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingLazy = false;

  @observable
  List<SocialUserModel>? socialUserList = [];

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void _changeLoadingLazy() {
    isLoadingLazy = !isLoadingLazy;
  }

  @action
  Future<void> _fetchAllUser() async {
    _changeLoading();
    final response = await _socialService!.fetchUserList(FriendQuery());
    socialUserList = response;
    _changeLoading();
  }

  @action
  Future<void> fetchAllUserLazy(int index) async {
    if (isLoadingLazy ||
        index != socialUserList!.length - 1 ||
        isLazyLoadataFinish) return;
    _changeLoadingLazy();

    final response = await _socialService!
        .fetchUserList(FriendQuery(limit: _page + 1, q: _query));

    if (response.isNotEmpty) {
      if (socialUserList!.isEmpty) {
        socialUserList = response;
      } else if (response.last != socialUserList!.last) {
        socialUserList!.addAll(response);
        socialUserList = socialUserList;
      }
      _page++;
    } else {
      isLazyLoadataFinish = true;
    }

    _changeLoadingLazy();
  }

  @action
  Future<void> fetchAllUserSearchQuery(String text) async {
    _throttleHelper!.onDelayTouch(text, (text) async {
      if (_query.isEmpty) {
        _page = -1;
      }
      _query = text!;
      isLazyLoadataFinish = false;
      socialUserList = [];
      await fetchAllUserLazy(socialUserList!.length - 1);
    });
  }
}
