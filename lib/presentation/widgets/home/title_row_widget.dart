import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../global/text_app.dart';

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget({super.key,required this.text, this.onPressed, this.isShowSeeAll =true,this.textButton = "Edit"});
  final String text;
  final Function()? onPressed;
  final bool? isShowSeeAll;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(text: text,fontSize: font22,fontWeight: FontWeight.w400,color: Colors.black,),
        isShowSeeAll == true ? TextButton(onPressed: onPressed, child:  TextApp(text: textButton,color: AppColors.primaryColor,fontSize: font16,decoration: TextDecoration.underline,decorationThickness: 2,decorationColor: AppColors.primaryColor,fontWeight: FontWeight.w700,)):Container()
      ],
    );
  }
}
