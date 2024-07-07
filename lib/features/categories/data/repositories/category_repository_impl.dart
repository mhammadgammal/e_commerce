import 'package:e_commerce/features/categories/data/network/categories_api_service.dart';
import 'package:e_commerce/features/categories/domain/entity/category_entity/category_response.dart';

import '../../domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoriesApiServiceImpl _categoriesApiService;

  CategoryRepositoryImpl(this._categoriesApiService);

  @override
  Future<CategoryResponse> getCategories() async {
    var response = await _categoriesApiService.getCategories();
    print(response.data);
    return CategoryResponse.fromJson(response.data);
  }
}
