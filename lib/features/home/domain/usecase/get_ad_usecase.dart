import '../../../../core/base_use_case/base_usecase.dart';
import '../../data/repositories/products_repository_impl.dart';

class GetAdUsecase implements BaseUsecase<String> {
  final ProductsRepositoryImpl _productsRepository;
  GetAdUsecase(this._productsRepository);

  @override
  Future<String> perform(params) async {
    var productsResponse = await _productsRepository.fetchProducts();
    return productsResponse.ad ?? '';
  }
}
