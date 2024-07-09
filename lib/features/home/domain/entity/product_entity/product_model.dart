class ProductModel {
  String id;
  String price;
  String oldPrice;
  String discountPercentage;
  String title;
  String image;
  bool isFavourite;
  bool isCart;

  ProductModel(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discountPercentage,
      required this.title,
      required this.image,
      this.isFavourite = false,
      this.isCart = false});

  factory ProductModel.fromJson(Map<String, dynamic> productsResponse) =>
      ProductModel(
          id: productsResponse['id'].toString(),
          price: productsResponse['price'].toString(),
          oldPrice: productsResponse['old_price'].toString(),
          discountPercentage: productsResponse['discount'].toString(),
          title: productsResponse['name'],
          image: productsResponse['image'],
          isFavourite: productsResponse['in_favorites'] ?? true,
          isCart: productsResponse['in_cart']?? false);
}
