// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SocialViewModel on _SocialViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_SocialViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoadingLazyAtom = Atom(name: '_SocialViewModelBase.isLoadingLazy');

  @override
  bool get isLoadingLazy {
    _$isLoadingLazyAtom.reportRead();
    return super.isLoadingLazy;
  }

  @override
  set isLoadingLazy(bool value) {
    _$isLoadingLazyAtom.reportWrite(value, super.isLoadingLazy, () {
      super.isLoadingLazy = value;
    });
  }

  final _$socialUserListAtom =
      Atom(name: '_SocialViewModelBase.socialUserList');

  @override
  List<SocialUserModel>? get socialUserList {
    _$socialUserListAtom.reportRead();
    return super.socialUserList;
  }

  @override
  set socialUserList(List<SocialUserModel>? value) {
    _$socialUserListAtom.reportWrite(value, super.socialUserList, () {
      super.socialUserList = value;
    });
  }

  final _$_fetchAllUserAsyncAction =
      AsyncAction('_SocialViewModelBase._fetchAllUser');

  @override
  Future<void> _fetchAllUser() {
    return _$_fetchAllUserAsyncAction.run(() => super._fetchAllUser());
  }

  final _$fetchAllUserLazyAsyncAction =
      AsyncAction('_SocialViewModelBase.fetchAllUserLazy');

  @override
  Future<void> fetchAllUserLazy(int index) {
    return _$fetchAllUserLazyAsyncAction
        .run(() => super.fetchAllUserLazy(index));
  }

  final _$fetchAllUserSearchQueryAsyncAction =
      AsyncAction('_SocialViewModelBase.fetchAllUserSearchQuery');

  @override
  Future<void> fetchAllUserSearchQuery(String text) {
    return _$fetchAllUserSearchQueryAsyncAction
        .run(() => super.fetchAllUserSearchQuery(text));
  }

  final _$_SocialViewModelBaseActionController =
      ActionController(name: '_SocialViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$_SocialViewModelBaseActionController.startAction(
        name: '_SocialViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_SocialViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingLazy() {
    final _$actionInfo = _$_SocialViewModelBaseActionController.startAction(
        name: '_SocialViewModelBase._changeLoadingLazy');
    try {
      return super._changeLoadingLazy();
    } finally {
      _$_SocialViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoadingLazy: ${isLoadingLazy},
socialUserList: ${socialUserList}
    ''';
  }
}
