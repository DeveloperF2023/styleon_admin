import 'package:flutter/material.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key, required this.productDiscount});
  final String productDiscount;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius5),
        color:Colors.black26,
      ),
      child: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width5,vertical: height3),
          child: TextApp(text: productDiscount,color: Colors.white,fontSize: font12,),
        ),
      ),

    );
  }
}
