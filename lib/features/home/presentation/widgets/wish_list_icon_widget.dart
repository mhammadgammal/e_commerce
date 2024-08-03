import 'package:flutter/material.dart';

class WishListIcon extends StatelessWidget {
  const WishListIcon(
      {super.key,
      required this.isFavourite,
      required this.onFavPressed,
      required this.index});

  final int index;
  final bool isFavourite;
  final void Function(int, bool) onFavPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.0,
      height: 45.0,
      child: Card(
        color: Colors.white,
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          // side: const BorderSide(
          //   width: 35.0,
          // ),
        ),
        child: IconButton(
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
            color: Colors.black,
          ),
          onPressed: () {
            print('on wish list pressed');
            onFavPressed(index, isFavourite);
          },
        ),
      ),
    );
  }
}
