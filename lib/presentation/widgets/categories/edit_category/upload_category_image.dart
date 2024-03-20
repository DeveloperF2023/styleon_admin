import 'package:admin/controller/categories/add_category_controller.dart';
import 'package:admin/controller/categories/edit_category_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class UploadImageCategoryWidget extends GetView<EditCategoryController> {
  final void Function()? onTapUpload;
  const UploadImageCategoryWidget({
    super.key,
    this.onTapUpload,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(EditCategoryController);
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
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius5),
                    ),
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: onTapUpload,
                            icon: Icon(
                              Icons.cloud_upload_outlined,
                              color: AppColors.primaryColor,
                              size: font25,
                            )),
                        RichText(
                          text: TextSpan(
                            text: '',
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Upload',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: font14,
                                    fontFamily: "Poppins",
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryColor,
                                    color: AppColors.primaryColor,
                                  )),
                              TextSpan(
                                  text: ' Or drag and drop',
                                  style: TextStyle(
                                      fontSize: font14,
                                      fontFamily: "Poppins",
                                      color: AppColors.grey600)),
                            ],
                          ),
                        )
                      ],
                    )))
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(radius5)
                          ),
                          child: Center(
                            child: Icon(Icons.upload,color: AppColors.textColor,size: font22,),
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
