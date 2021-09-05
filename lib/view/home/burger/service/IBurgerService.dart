import 'package:vexana/vexana.dart';

import '../../../_product/enum/burger_network_enum.dart';
import '../model/burger_model.dart';

abstract class IBurgerService {
  final INetworkManager manager;

  IBurgerService(this.manager);

  Future<List<BurgerModel>> fetchFavoriteBurgers();
  Future<List<BurgerModel>> fetchBurgersLimited({double? max = 50, double? min = 0});
  Future<List<BurgerModel>> fetchBurgersSorted(
      {required BurgerSortValues sort,
      BurgerSortValuesType type = BurgerSortValuesType.ASC});
}
