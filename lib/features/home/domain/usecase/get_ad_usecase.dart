import '../../../../core/base_use_case/base_usecase.dart';
import '../../data/repositories/products_repository_impl.dart';

class GetProductsUsecase implements BaseUsecase<String> {
  final ProductsRepositoryImpl _productsRepository;
  GetProductsUsecase(this._productsRepository);

  @override
  Future<String> perform() async {
    var productsResponse = await _productsRepository.fetchProducts();
    return productsResponse.ad ?? '';
  }
}
