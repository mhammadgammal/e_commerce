import 'package:e_commerce/core/theme/app_text_style.dart';
import 'package:e_commerce/core/widgets/search_field.dart';
import 'package:e_commerce/features/home/domain/entity/product_entity/product_model.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/price_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/wish_list_icon_widget.dart';
import 'package:e_commerce/features/profile/presentation/widgets/custom_divier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: SearchField(
            searchController: TextEditingController(),
            onSearchFieldPressed: () {}),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsetsDirectional.all(15.0),
              children: [
                Text(
                  widget.productModel.title.split(' ')[0],
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  widget.productModel.title,
                  maxLines: 2,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200.0,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: widget.productModel.images.length,
                        itemBuilder: (context, index) =>
                            Image.network(widget.productModel.images[index]),
                      ),
                    ),
                    WishListIcon(
                        isFavourite: widget.productModel.isFavourite,
                        onFavPressed: context.read<HomeCubit>().onFavPressed)
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: SmoothPageIndicator(
                      controller: _controller,
                      effect: const WormEffect(
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          activeDotColor: Colors.black),
                      count: widget.productModel.images.length),
                ),
                PriceWidget(
                    oldPrice: widget.productModel.oldPrice,
                    price: widget.productModel.price,
                    discount: widget.productModel.discountPercentage),
                const CustomDivier(
                  indent: 0.0,
                ),
                Text('Description',
                    style: AppTextStyle.font20BlackBold
                      ..copyWith(fontWeight: FontWeight.normal)),
                Text(widget.productModel.description),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 15.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Add To Cart',
                style:
                    AppTextStyle.font20BlackBold.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
