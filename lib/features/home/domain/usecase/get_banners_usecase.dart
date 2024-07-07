import '../../../../core/base_use_case/base_usecase.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../entity/banner_entity/banner_model.dart';

class GetBannersUsecase implements BaseUsecase<List<BannerModel>> {
  final ProductsRepositoryImpl _productsRepository;
  GetBannersUsecase(this._productsRepository);

  @override
  Future<List<BannerModel>> perform(params) async {
    var productsRes = await _productsRepository.fetchProducts();
    return productsRes.banners;
  }
}
