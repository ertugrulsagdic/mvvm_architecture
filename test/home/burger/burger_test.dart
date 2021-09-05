import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_architecture_3/core/init/network/vexana_manager.dart';
import 'package:mvvm_architecture_3/view/_product/enum/burger_network_enum.dart';
import 'package:mvvm_architecture_3/view/home/burger/service/IBurgerService.dart';
import 'package:mvvm_architecture_3/view/home/burger/service/burger_service.dart';

void main() {
  IBurgerService? burgerService;
  setUp(() {
    burgerService = BurgerService(VexanaManager.instance.networkManager);
  });
  test('Fetch favorite burgers', () async {
    final response = await burgerService!.fetchFavoriteBurgers();

    expect(response, isNotEmpty);
  });

  test('Fetch min 20 max 30 burgers', () async {
    final response = await burgerService!.fetchBurgersLimited(min: 20, max: 30);

    expect(response, isNotEmpty);
  });

  test('Fetch sort rate Burgers', () async {
    final response =
        await burgerService!.fetchBurgersSorted(sort: BurgerSortValues.RATES);

    expect(response, isNotEmpty);
  });
}
