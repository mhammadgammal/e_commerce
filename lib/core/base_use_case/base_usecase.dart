abstract interface class BaseUsecase<T> {
  Future<T> perform();
}
