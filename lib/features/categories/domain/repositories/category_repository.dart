import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';

import '../entity/category_entity/category_response.dart';

abstract interface class CategoryRepository {
  Future<CategoryResponse> getCategories();

  Future<List<ProductModel>> getCategoryProducts(int params);
}
