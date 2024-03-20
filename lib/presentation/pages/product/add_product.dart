import 'package:admin/controller/products/add_product_controller.dart';
import 'package:admin/core/class/handling_dataview.dart';
import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/core/functions/validator_input.dart';
import 'package:admin/presentation/widgets/global/app_bar.dart';
import 'package:admin/presentation/widgets/global/navigation_button_widget.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/global/drop_down_list.dart';
import '../../widgets/products/add_product/upload_image_product.dart';
import '../../widgets/products/edit_product/field_section_widget.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProductController());
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBarWidget(
        title: "Add Product",
        automaticallyImplyLeading: true,
        onPressed: () {
          Get.back();
        },
      ),
      body: SafeArea(
          child: GetBuilder<AddProductController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: "* All fields are required",
                  fontSize: font14,
                  color: AppColors.green,
                ),
                sizeVertical(height10),
                HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                        key: controller.formState,
                        child: Container(
                          child: Column(
                            children: [
                              UploadImageOfProductWidget(
                                onTapUpload: () {
                                  controller.showOptionToUploadImage(context);
                                },
                              ),
                              sizeVertical(height20),
                              Row(
                                children: [
                                  FieldSectionWidget(
                                    controller:
                                        controller.productNameController!,
                                    title: '* Product Name EN',
                                    validator: (value) {
                                      return validateInput(
                                          value!, 1, 100, "Product Name");
                                    },
                                  ),
                                  sizeHorizontal(width5),
                                  FieldSectionWidget(
                                    controller:
                                        controller.productNameFRController!,
                                    title: '* Product Name FR',
                                    validator: (value) {
                                      return validateInput(
                                          value!, 1, 100, "Product Name FR");
                                    },
                                  ),
                                ],
                              ),
                              sizeVertical(height20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextApp(
                                    text: "* Category",
                                    fontSize: font12,
                                    color: AppColors.textColor,
                                  ),
                                  sizeVertical(height5),
                                  SearchOfDropDownList(
                                    title: 'Categories',
                                    categories: controller.dropDownCategories,
                                    dropDownSelectedName:
                                        controller.categoryNameController!,
                                    dropDownSelectedId:
                                        controller.categoryIDController!,
                                  ),
                                ],
                              ),
                              sizeVertical(height20),
                              Row(
                                children: [
                                  FieldSectionWidget(
                                    controller: controller
                                        .productDescriptionController!,
                                    title: '* Product Description EN',
                                    validator: (value) {
                                      return validateInput(value!, 1, 100,
                                          "Product Description EN");
                                    },
                                  ),
                                  sizeHorizontal(width5),
                                  FieldSectionWidget(
                                    controller: controller
                                        .productDescriptionFRController!,
                                    title: '* Product Description FR',
                                    validator: (value) {
                                      return validateInput(value!, 1, 100,
                                          "Product Description FR");
                                    },
                                  ),
                                ],
                              ),
                              sizeVertical(height20),
                              Row(
                                children: [
                                  FieldSectionWidget(
                                    controller:
                                        controller.productStockController!,
                                    title: '* Product Stock',
                                    validator: (value) {
                                      return validateInput(
                                          value!, 1, 100, "Product Stock");
                                    },
                                  ),
                                ],
                              ),
                              sizeVertical(height20),
                              Row(
                                children: [
                                  FieldSectionWidget(
                                    controller:
                                        controller.productPriceController!,
                                    title: '* Product Price',
                                    validator: (value) {
                                      return validateInput(
                                          value!, 1, 100, "Product Price");
                                    },
                                  ),
                                  sizeHorizontal(width5),
                                  FieldSectionWidget(
                                    controller:
                                        controller.productDiscountController!,
                                    title: '* Product Discount',
                                    validator: (value) {
                                      return validateInput(
                                          value!, 1, 100, "Product Discount");
                                    },
                                  ),
                                ],
                              ),
                              sizeVertical(height20),
                              NavigationButtonWidget(
                                textButton: "Add Product",
                                icon: Icons.add_box,
                                onPressed: () {
                                  controller.addProduct();
                                },
                              )
                            ],
                          ),
                        )))
              ],
            ),
          ),
        );
      })),
    );
  }
}
