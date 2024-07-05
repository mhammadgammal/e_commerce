import 'banner_model.dart';
import 'product_model.dart';

class ProductsResponse {
  bool status;
  String? message;
  List<BannerModel> banners;
  List<ProductModel> products;
  String? ad;

  ProductsResponse(
      {required this.status,
      required this.message,
      required this.banners,
      required this.ad,
      required this.products});
 
 
  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        status: json["status"],
        message: json["message"],
        banners: List<BannerModel>.from(json["data"]["banners"]
            .map((banner) => BannerModel.fromJson(banner))),
        products: List<ProductModel>.from(json["data"]["products"]
            .map((banner) => ProductModel.fromJson(banner))),
        ad: json["data"]["ad"],
      );
}
