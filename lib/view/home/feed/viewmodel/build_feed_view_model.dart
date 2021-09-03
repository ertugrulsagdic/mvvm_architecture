import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/model/base_view_model.dart';
import '../../../_product/_utility/decoration_helper.dart';
import '../model/house_model.dart';
import '../service/IBuildFeedService.dart';
import '../service/build_feed_service.dart';
part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  DecorationHelper? helper;
  IBuildFeedService? feedService;

  List<HouseModel>? houseModels = [];

  @observable
  List<String> likedItems = [];

  @action
  void onLikeItemPressed(String id) {
    print(id);
    if (likedItems.contains(id)) {
      likedItems.remove(id);
    } else {
      likedItems.add(id);
    }
    likedItems = likedItems;
  }

  @computed
  HouseModel get sliderHouse => houseModels!.first;

  @override
  void init() {
    helper = DecorationHelper(context: context);

    feedService = BuildFeedService(vexanaManager.networkManager, scaffoldKey);
  }

  @observable
  bool isLoading = false;

  @action
  void _changeLoadingState() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getListAll() async {
    _changeLoadingState();
    houseModels = await feedService!.fetchUserHouseList();
    _changeLoadingState();
  }
}
