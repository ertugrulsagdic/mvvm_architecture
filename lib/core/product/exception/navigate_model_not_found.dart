class NavigateException<T> implements Exception {
  final model;

  NavigateException(this.model);

  @override
  String toString() {
    return 'This model variable is not found in route: $model and $T';
  }
}
