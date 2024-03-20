import 'package:admin/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';

class CouponDiscountWidget extends StatelessWidget {
  const CouponDiscountWidget({super.key, required this.couponDiscount, required this.totalCoupon, required this.color});
  final String couponDiscount;
  final String totalCoupon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(couponDiscount,style: GoogleFonts.arimo(
            fontSize: font25,color: AppColors.textColor,fontWeight: FontWeight.w700,
          ),),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius5),
                color: color
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width5,vertical: height3),
              child: Row(
                children: [
                  Icon(Icons.discount_outlined,color: AppColors.white,size: font14,),
                  sizeHorizontal(width3),
                  Text(totalCoupon,style: GoogleFonts.arimo(
                    fontSize: font14,color: AppColors.white,fontWeight: FontWeight.w700,
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
