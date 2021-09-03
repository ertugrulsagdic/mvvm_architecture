enum NetworkRoutes { LOGIN, BUILD_HOME, FRIENDS, GAME, SLIDER }

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
      default:
        throw Exception('Routes Not Found');
    }
  }
}
