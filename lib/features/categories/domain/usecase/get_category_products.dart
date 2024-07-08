import 'package:e_commerce/core/base_use_case/base_usecase.dart';
import 'package:e_commerce/features/categories/data/repositories/category_repository_impl.dart';

import '../../../home/domain/entity/product_entity/product_model.dart';

class GetCategoryProductsUsecase implements BaseUsecase<List<ProductModel>> {
  final CategoryRepositoryImpl _categoryRepositoryImpl;

  GetCategoryProductsUsecase(this._categoryRepositoryImpl);

  @override
  Future<List<ProductModel>> perform(params) async {
    print(params.runtimeType);
    return await _categoryRepositoryImpl.getCategoryProducts(params as int);
  }
}
