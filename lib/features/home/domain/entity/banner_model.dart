class BannerModel {
  String id;
  String image;

  BannerModel({required this.id, required this.image});

  factory BannerModel.fromJson(Map<String, dynamic> bannerResponse) =>
      BannerModel(
          id: bannerResponse['id'].toString(), image: bannerResponse['image']);
}
