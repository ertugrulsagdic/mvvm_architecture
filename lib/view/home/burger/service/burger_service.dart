import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/enum/burger_network_enum.dart';
import '../../../_product/enum/burger_query_enum.dart';
import '../../../_product/enum/network_route.enum.dart';
import '../../../_product/mixin/service_helper.dart';
import '../model/burger_model.dart';
import 'IBurgerService.dart';

class BurgerService extends IBurgerService with ServiceHelper {
  BurgerService(INetworkManager manager) : super(manager);

  @override
  Future<List<BurgerModel>> fetchBurgersLimited(
      {double? max = 50, double? min = 0}) async {
    final response = await manager.send<BurgerModel, List<BurgerModel>>(
      NetworkRoutes.BURGERS_PRICE.rawValue,
      parseModel: BurgerModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries([
        BurgerQueryParams.MIN.rawValue(min),
        BurgerQueryParams.MAX.rawValue(max)
      ]),
    );
    showLog(response);
    return response.data ?? [];
  }

  @override
  Future<List<BurgerModel>> fetchBurgersSorted(
      {required BurgerSortValues sort,
      BurgerSortValuesType type = BurgerSortValuesType.ASC}) async {
    final response = await manager.send<BurgerModel, List<BurgerModel>>(
      NetworkRoutes.BURGERS.rawValue,
      parseModel: BurgerModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries([
        BurgerQueryParams.SORT.rawValue(sort.rawValue),
        BurgerQueryParams.SORT_TYPE.rawValue(type.rawValue)
      ]),
    );
    showLog(response);
    return response.data ?? [];
  }

  @override
  Future<List<BurgerModel>> fetchFavoriteBurgers() async {
    final response = await manager.send<BurgerModel, List<BurgerModel>>(
        NetworkRoutes.BURGERS.rawValue,
        parseModel: BurgerModel(),
        method: RequestType.GET,
        queryParameters:
            Map.fromEntries([BurgerQueryParams.FAVORITE.rawValue(true)]));
    showLog(response);
    return response.data ?? [];
  }
}
