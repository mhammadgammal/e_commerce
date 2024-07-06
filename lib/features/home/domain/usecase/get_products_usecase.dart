import 'package:e_commerce/features/home/data/repositories/products_repository_impl.dart';

import '../../../../core/base_use_case/base_usecase.dart';
import '../entity/product_entity/product_model.dart';

class GetProductsUsecase implements BaseUsecase<List<ProductModel>> {
  final ProductsRepositoryImpl _productsRepository;
  GetProductsUsecase(this._productsRepository);

  @override
  Future<List<ProductModel>> perform() async {
    var productsRes = await _productsRepository.fetchProducts();
    return productsRes.products;
  }
}
