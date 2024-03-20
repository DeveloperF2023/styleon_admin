import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/core/constants/image_assets.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';

class UsernameAndEmailOfUserWidget extends StatelessWidget {
  const UsernameAndEmailOfUserWidget({super.key, required this.username, required this.email, required this.phone});
   final String username;
   final String email;
   final String phone;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width10),
          child: Container(
            height: screenHeight*.13,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius5),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("${ImageAssets.backgroundIUserImage}"))
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width10),
              child: Container(
                height: screenHeight*.13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius5),
                    color: Color(0xff4940ff).withOpacity(0.8)
                ),
              ),
            )),
        Positioned(
            top: height10,
            left:width20,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(text: username,fontSize: font18,color: AppColors.white,),
                  sizeVertical(height10),
                  Row(
                    children: [
                      Icon(Icons.email,color: AppColors.white,size: font22,),
                      sizeHorizontal(width5),
                      TextApp(text: email,fontSize: font16,color: AppColors.white,),
                    ],
                  ),
                  sizeVertical(height5),
                  Row(
                    children: [
                      Icon(Icons.phone,color: AppColors.white,size: font22,),
                      sizeHorizontal(width5),
                      TextApp(text: phone,fontSize: font16,color: AppColors.white,),
                    ],
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
