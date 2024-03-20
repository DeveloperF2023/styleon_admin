import 'package:admin/controller/categories/add_category_controller.dart';
import 'package:admin/controller/products/add_product_controller.dart';
import 'package:admin/controller/products/edit_product_controller.dart';
import 'package:admin/core/constants/api_constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class UploadImageOfEditProductWidget extends GetView<EditProductController> {
  final void Function()? onTapUpload;
  const UploadImageOfEditProductWidget({
    super.key,
    this.onTapUpload,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(EditProductController);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius5),
          border: Border.all(color: AppColors.subtitleColor!, width: 1.2)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width20, vertical: height20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextApp(
              text: "Image",
              fontSize: font14,
              color: AppColors.textColor,
            ),
            sizeVertical(height10),
            controller.file == null
                ? DottedBorder(
                color: AppColors.subtitleColor!,
                borderType: BorderType.RRect,
                radius: Radius.circular(radius5),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: screenHeight * .15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("${ApiConstants.IMAGE_ITEMS}/${controller.imageOld}"))
                      ),
                    ),
                    Positioned(
                        top: height5,
                        right: width5,
                        child: InkWell(
                          onTap: onTapUpload,
                          child: Container(
                            height: height32,
                            width: width32,
                            color: AppColors.white,
                            child: Center(
                              child: Icon(Icons.upload,size: font22,color: AppColors.textColor,),
                            ),
                          ),
                        ))
                  ],
                ),)
                : DottedBorder(
              color: AppColors.subtitleColor!,
              borderType: BorderType.RRect,
              radius: Radius.circular(radius5),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: screenHeight * .15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius5),
                    ),
                    child: Image.file(
                      controller.file!,
                      height: screenHeight * .15,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: height5,
                      right: width5,
                      child: InkWell(
                        onTap: onTapUpload,
                        child: Container(
                          height: height32,
                          width: width32,
                          color: AppColors.white,
                          child: Center(
                            child: Icon(Icons.upload,size: font22,color: AppColors.textColor,),
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
