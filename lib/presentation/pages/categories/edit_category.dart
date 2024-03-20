import 'package:admin/controller/categories/add_category_controller.dart';
import 'package:admin/controller/categories/edit_category_controller.dart';
import 'package:admin/core/class/handling_dataview.dart';
import 'package:admin/core/constants/api_constants.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/core/functions/upload_image.dart';
import 'package:admin/core/functions/validator_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../widgets/global/app_bar.dart';
import '../../widgets/categories/edit_category/upload_category_image.dart';
import '../../widgets/global/navigation_button_widget.dart';
import '../../widgets/products/edit_product/body/upload_image_widget.dart';
import '../../widgets/products/edit_product/field_section_widget.dart';
import '../../widgets/global/text_app.dart';

class EditCategoriesScreen extends StatelessWidget {
  const EditCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditCategoryController());
    return GetBuilder<EditCategoryController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget(
          title: "Edit Category",
          automaticallyImplyLeading: true,
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: AppColors.white,
        body: SafeArea(
            child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width10, vertical: height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: "* All fields are required",
                fontSize: font14,
                color: AppColors.green,
                fontWeight: FontWeight.bold,
              ),
              sizeVertical(height10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text:
                        "If you don't choose image that's mean you choose old image",
                    fontSize: font14,
                    color: AppColors.textColor!.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                  sizeVertical(height10),
                  Container(
                    height: screenHeight * .08,
                    width: screenWidth * .3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "${ApiConstants.IMAGE_CATEGORIES}/${controller.imageOld}"))),
                  )
                ],
              ),
              sizeVertical(height10),
              HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                      key: controller.formStateCategory,
                      child: Column(
                        children: [
                          UploadImageCategoryWidget(
                            onTapUpload: () {
                              controller.chooseImage();
                            },
                          ),
                          sizeVertical(height20),
                          FieldSectionWidget(
                            controller: controller.categoryNameController,
                            title: '* Category Name EN',
                            isExpanded: false,
                            validator: (value) {
                              return validateInput(value!, 1, 100, "");
                            },
                          ),
                          sizeVertical(height20),
                          FieldSectionWidget(
                            controller: controller.categoryNameFRController,
                            title: '* Category Name FR',
                            isExpanded: false,
                            validator: (value) {
                              return validateInput(value!, 1, 100, "");
                            },
                          ),
                          sizeVertical(height20),
                          NavigationButtonWidget(
                            textButton: 'Edit Category',
                            icon: Icons.check,
                            onPressed: () {
                              controller.editCategory();
                            },
                          )
                        ],
                      )))
            ],
          ),
        )),
      );
    });
  }
}
