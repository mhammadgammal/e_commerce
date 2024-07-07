import 'package:e_commerce/core/base_use_case/base_usecase.dart';
import 'package:e_commerce/features/categories/data/repositories/category_repository_impl.dart';
import 'package:e_commerce/features/categories/domain/entity/category_entity/category_model.dart';

class GetCategoriesUsecase implements BaseUsecase<List<CategoryModel>> {
  final CategoryRepositoryImpl _categoryRepository;
  GetCategoriesUsecase(this._categoryRepository);
  @override
  Future<List<CategoryModel>> perform() async {
    var categoriesRes = await _categoryRepository.getCategories();
    return categoriesRes.categories;
  }
}
