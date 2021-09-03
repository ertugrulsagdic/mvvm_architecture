import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../model/game_enums.dart';
import '../model/game_model.dart';
import '../model/slider_model.dart';
import '../service/game_service.dart';

part 'game_view_model.g.dart';

class GameViewModel = _GameViewModelBase with _$GameViewModel;

abstract class _GameViewModelBase with Store, BaseViewModel {
  final List<String> gameTabItems = [
    LocaleKeys.home_game_tabbar_tab1,
    LocaleKeys.home_game_tabbar_tab2,
    LocaleKeys.home_game_tabbar_tab3,
    LocaleKeys.home_game_tabbar_tab4,
    LocaleKeys.home_game_tabbar_tab5
  ];

  final GameService gameService;

  _GameViewModelBase(this.gameService);

  List<SliderModel>? sliderItems = [];
  List<GameModel> newGameList = [], topGameList = [];

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    fetchSliderItems();
  }

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchSliderItems() async {
    changeLoading();
    final response = await gameService.fetchSliderItems();
    sliderItems = response;
    changeLoading();
  }

  Future<List<GameModel>> onNewGameItems() async {
    if (newGameList.isNotEmpty) return newGameList;
    final response = await gameService.fetchGameItems(GameEnum.NEW);
    newGameList = response!;
    return response;
  }

  Future<List<GameModel>> onTopGameItems() async {
    if (topGameList.isNotEmpty) return topGameList;
    final response = await gameService.fetchGameItems(GameEnum.TOP);
    topGameList = response!;
    return response;
  }
}
