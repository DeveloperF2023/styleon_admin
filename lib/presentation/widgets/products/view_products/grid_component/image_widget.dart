import 'package:flutter/material.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/constants/dimensions.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.productImage});
  final String productImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .18,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(radius10),topRight: Radius.circular(radius10)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  productImage))),
    );
  }
}
