import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';

class CouponNameWidget extends StatelessWidget {
  const CouponNameWidget({super.key, required this.couponName});
  final String couponName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height30,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //TextApp(text: "${couponModel.couponName}",fontSize: font16,color: AppColors.textColor,fontWeight: FontWeight.w500,),
            Text(couponName,style: GoogleFonts.arimo(
              fontSize: font16,color: AppColors.textColor,fontWeight: FontWeight.w600,
            ),),
            Icon(Icons.more_horiz,color: const Color(0xff6f7fa2),size: font25,)
          ],
        ),
      ),
    );
  }
}
