import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_utility/service_helper.dart';
import '../../../_product/enum/network_route.enum.dart';
import '../model/game_enums.dart';
import '../model/game_model.dart';
import '../model/slider_model.dart';
import 'IGameService.dart';

class GameService extends IGameService with ServiceHelper {
  GameService(INetworkManager manager, GlobalKey<ScaffoldState>? scaffoldKey)
      : super(manager, scaffoldKey);

  @override
  Future<List<GameModel>?> fetchGameItems(GameEnum type) async {
    final response = await manager.send<GameModel, List<GameModel>>(
      NetworkRoutes.GAME.rawValue,
      parseModel: GameModel(),
      method: RequestType.GET,
      urlSuffix: '/${type.index + 1}',
    );
    showMessage(scaffoldKey, response.error);
    return response.data;
  }

  @override
  Future<List<SliderModel>?> fetchSliderItems() async {
    final response = await manager.send<SliderModel, List<SliderModel>>(
      NetworkRoutes.SLIDER.rawValue,
      parseModel: SliderModel(),
      method: RequestType.GET,
    );
    showMessage(scaffoldKey, response.error);
    return response.data;
  }
}
