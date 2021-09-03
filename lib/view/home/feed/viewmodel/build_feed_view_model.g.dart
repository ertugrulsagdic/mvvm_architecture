// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_feed_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BuildFeedViewModel on _BuildFeedViewModelBase, Store {
  Computed<HouseModel>? _$sliderHouseComputed;

  @override
  HouseModel get sliderHouse =>
      (_$sliderHouseComputed ??= Computed<HouseModel>(() => super.sliderHouse,
              name: '_BuildFeedViewModelBase.sliderHouse'))
          .value;

  final _$likedItemsAtom = Atom(name: '_BuildFeedViewModelBase.likedItems');

  @override
  List<String> get likedItems {
    _$likedItemsAtom.reportRead();
    return super.likedItems;
  }

  @override
  set likedItems(List<String> value) {
    _$likedItemsAtom.reportWrite(value, super.likedItems, () {
      super.likedItems = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_BuildFeedViewModelBase.isLoading');

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

  final _$getListAllAsyncAction =
      AsyncAction('_BuildFeedViewModelBase.getListAll');

  @override
  Future<void> getListAll() {
    return _$getListAllAsyncAction.run(() => super.getListAll());
  }

  final _$_BuildFeedViewModelBaseActionController =
      ActionController(name: '_BuildFeedViewModelBase');

  @override
  void onLikeItemPressed(String id) {
    final _$actionInfo = _$_BuildFeedViewModelBaseActionController.startAction(
        name: '_BuildFeedViewModelBase.onLikeItemPressed');
    try {
      return super.onLikeItemPressed(id);
    } finally {
      _$_BuildFeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingState() {
    final _$actionInfo = _$_BuildFeedViewModelBaseActionController.startAction(
        name: '_BuildFeedViewModelBase._changeLoadingState');
    try {
      return super._changeLoadingState();
    } finally {
      _$_BuildFeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
likedItems: ${likedItems},
isLoading: ${isLoading},
sliderHouse: ${sliderHouse}
    ''';
  }
}
