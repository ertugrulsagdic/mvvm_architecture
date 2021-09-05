enum BurgerSortValues { NAME, PRICE, RATES, UPDATED }
enum BurgerSortValuesType { ASC, DSC }

extension BurgerSortValuesExtension on BurgerSortValues {
  String get rawValue {
    switch (this) {
      case BurgerSortValues.NAME:
        return 'name';
      case BurgerSortValues.PRICE:
        return 'price';
      case BurgerSortValues.RATES:
        return 'rates';
      case BurgerSortValues.UPDATED:
        return 'updated';
    }
  }
}

extension BurgerSortValuesTypeExtension on BurgerSortValuesType {
  int get rawValue {
    switch (this) {
      case BurgerSortValuesType.ASC:
        return -1;
      case BurgerSortValuesType.DSC:
        return 1;
    }
  }
}
