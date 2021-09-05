enum BurgerQueryParams { FAVORITE, SORT, SORT_TYPE, MIN, MAX }

extension BurgerQueryParamsExtensions on BurgerQueryParams {
  MapEntry<String, dynamic> rawValue(dynamic value) {
    switch (this) {
      case BurgerQueryParams.FAVORITE:
        return MapEntry('isFavorite', value);
      case BurgerQueryParams.SORT:
        return MapEntry('sort', value);
      case BurgerQueryParams.SORT_TYPE:
        return MapEntry('sortType', value);
      case BurgerQueryParams.MIN:
        return MapEntry('min', value);
      case BurgerQueryParams.MAX:
        return MapEntry('max', value);
    }
  }
}
