import 'package:flutter/material.dart';

class NetworkImageWithRoundedCorner extends StatelessWidget {
  const NetworkImageWithRoundedCorner({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          // Added ClipRRect
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(fit: BoxFit.cover, imageUrl),
        ));
  }
}
