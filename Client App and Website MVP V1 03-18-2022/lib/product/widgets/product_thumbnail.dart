import 'package:flutter/material.dart';

class ProductThumbnail extends StatelessWidget {
  final String image;
  const ProductThumbnail({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 1.2)]),
      child: Image(
        image: AssetImage(image),
      ),
    );
  }
}
