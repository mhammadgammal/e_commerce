import 'package:e_commerce/features/categories/data/network/categories_api_service.dart';
import 'package:e_commerce/features/categories/domain/entity/category_entity/category_response.dart';

import '../../../home/domain/entity/product_entity/product_model.dart';
import '../../domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoriesApiServiceImpl _categoriesApiService;

  CategoryRepositoryImpl(this._categoriesApiService);

  @override
  Future<CategoryResponse> getCategories() async {
    var response = await _categoriesApiService.getCategories();
    print(response.data);
    return CategoryResponse.fromJson(response.data);
  }

  @override
  Future<List<ProductModel>> getCategoryProducts(int categoryId) async {
    var response = await _categoriesApiService.getCategoryProducts(categoryId);
    var productsResponse = response.data['data']['data'];
    List<ProductModel> products = [];

    productsResponse.forEach((categoryProduct) =>
        products.add(ProductModel.fromJson(categoryProduct)));

    return products;
  }
}
