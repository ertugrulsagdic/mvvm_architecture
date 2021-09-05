// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burger_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BurgerViewModel on _BurgerViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_BurgerViewModelBase.isLoading');

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

  final _$favoriteBurgersAtom =
      Atom(name: '_BurgerViewModelBase.favoriteBurgers');

  @override
  List<BurgerModel> get favoriteBurgers {
    _$favoriteBurgersAtom.reportRead();
    return super.favoriteBurgers;
  }

  @override
  set favoriteBurgers(List<BurgerModel> value) {
    _$favoriteBurgersAtom.reportWrite(value, super.favoriteBurgers, () {
      super.favoriteBurgers = value;
    });
  }

  final _$mainBurgersAtom = Atom(name: '_BurgerViewModelBase.mainBurgers');

  @override
  List<BurgerModel> get mainBurgers {
    _$mainBurgersAtom.reportRead();
    return super.mainBurgers;
  }

  @override
  set mainBurgers(List<BurgerModel> value) {
    _$mainBurgersAtom.reportWrite(value, super.mainBurgers, () {
      super.mainBurgers = value;
    });
  }

  final _$fetchFavoriteAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchFavorite');

  @override
  Future<void> fetchFavorite() {
    return _$fetchFavoriteAsyncAction.run(() => super.fetchFavorite());
  }

  final _$_BurgerViewModelBaseActionController =
      ActionController(name: '_BurgerViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$_BurgerViewModelBaseActionController.startAction(
        name: '_BurgerViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_BurgerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
favoriteBurgers: ${favoriteBurgers},
mainBurgers: ${mainBurgers}
    ''';
  }
}
