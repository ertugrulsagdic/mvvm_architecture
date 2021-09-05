import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../_product/enum/burger_network_enum.dart';
import '../model/burger_model.dart';
import '../service/IBurgerService.dart';

part 'burger_view_model.g.dart';

class BurgerViewModel = _BurgerViewModelBase with _$BurgerViewModel;

abstract class _BurgerViewModelBase with Store, BaseViewModel {
  final IBurgerService burgerService;

  _BurgerViewModelBase(this.burgerService);

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    fetchFavorite();
  }

  bool _isAscanding = true;

  @action
  void changeAscanding(bool value) {
    _isAscanding = value;
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMain = false;

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void _changeLoadingMain() {
    isLoadingMain = !isLoadingMain;
  }

  @observable
  List<BurgerModel> favoriteBurgers = [];
  @observable
  List<BurgerModel> mainBurgers = [];

  @action
  Future<void> fetchFavorite() async {
    _changeLoading();
    favoriteBurgers = await burgerService.fetchFavoriteBurgers();
    _changeLoading();
  }

  @action
  Future<void> fetchBurgers() async {
    _changeLoading();
    mainBurgers =
        await burgerService.fetchBurgersSorted(sort: BurgerSortValues.RATES);
    _changeLoading();
  }

  RangeValues? _values;

  void changeRangeValues(RangeValues values) {
    _values = values;
  }

  @action
  Future<void> fetchMinMax() async {
    context!.navigation.pop();
    _changeLoading();
    mainBurgers = await burgerService.fetchBurgersLimited(
        max: _values?.end, min: _values?.start);
    _changeLoading();
  }

  @action
  Future<void> fetchSort(BurgerSortValues value) async {
    context!.navigation.pop();
    _changeLoading();
    mainBurgers = await burgerService.fetchBurgersSorted(
      sort: value,
      type: _isAscanding ? BurgerSortValuesType.ASC : BurgerSortValuesType.DSC,
    );
    _changeLoading();
  }
}
