enum NetworkRoutes {
  LOGIN,
  BUILD_HOME,
  FRIENDS,
  GAME,
  SLIDER,
  BURGERS,
  BURGERS_PRICE,
}

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return 'account/v1/Login';
      case NetworkRoutes.BUILD_HOME:
        return 'house';
      case NetworkRoutes.FRIENDS:
        return 'friends';
      case NetworkRoutes.GAME:
        return 'games';
      case NetworkRoutes.SLIDER:
        return 'slider';
      case NetworkRoutes.BURGERS:
        return 'burgers';
      case NetworkRoutes.BURGERS_PRICE:
        return 'burgers/price';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
