import '../entity/category_entity/category_response.dart';

abstract interface class CategoryRepository {
  Future<CategoryResponse> getCategories();
}
