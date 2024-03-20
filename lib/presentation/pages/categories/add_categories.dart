import 'package:admin/controller/categories/add_category_controller.dart';
import 'package:admin/core/class/handling_dataview.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/core/functions/upload_image.dart';
import 'package:admin/core/functions/validator_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../widgets/global/app_bar.dart';
import '../../widgets/global/navigation_button_widget.dart';
import '../../widgets/products/edit_product/body/upload_image_widget.dart';
import '../../widgets/products/edit_product/field_section_widget.dart';
import '../../widgets/global/text_app.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddCategoriesController());
    return GetBuilder<AddCategoriesController>(builder: (controller){
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget(
          title: "Add Category",
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
                  HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Form(
                      key: controller.formStateCategory,
                      child: Column(
                        children: [
                          UploadImageWidget(onTapUpload: (){
                            controller.chooseImage();
                          },),
                          sizeVertical(height20),
                          FieldSectionWidget(
                            controller: controller.categoryNameController!,
                            title: '* Category Name EN',
                            isExpanded: false,
                            validator: (value){
                              return validateInput(value!, 1, 100, "");
                            },
                          ),
                          sizeVertical(height20),
                          FieldSectionWidget(
                            controller: controller.categoryNameFRController!,
                            title: '* Category Name FR',
                            isExpanded: false,
                            validator: (value){
                              return validateInput(value!, 1, 100, "");
                            },
                          ),
                          sizeVertical(height20),
                          NavigationButtonWidget(textButton: 'Add Category', icon: Icons.check,onPressed: (){
                            controller.addCategory();
                          },)
                        ],
                      )))
                ],
              ),
            )),
      );
    });
  }
}


