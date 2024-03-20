

import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/widgets/global/text_app.dart';

bottomSheetToChooseImage(BuildContext context,chooseFromCamera(),chooseFromGallery()){
  return Get.bottomSheet(
    Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width10,vertical: height10),
          child: Wrap(
            children: [
              TextApp(text: 'Choose Option',fontSize: font16,color: AppColors.textColor,),
              ListTile(
                leading: Icon(Icons.image,size: font25,color: AppColors.green,),
                title: TextApp(text: 'Gallery',fontSize: font14,color: AppColors.textColor,),
                onTap: (){
                  chooseFromGallery();
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera,size: font25,color: AppColors.primaryColor,),
                title: TextApp(text: 'Camera',fontSize: font14,color: AppColors.textColor,),
                onTap: (){
                  chooseFromCamera();
                  Get.back();

                },
              ),
            ],
          ),
        )),
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius5)
    )
  );
}