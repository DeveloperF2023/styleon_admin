import 'package:admin/controller/products/edit_product_controller.dart';
import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/presentation/widgets/global/app_bar.dart';
import 'package:admin/presentation/widgets/global/navigation_button_widget.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/global/drop_down_list.dart';
import '../../widgets/products/edit_product/field_section_widget.dart';
import '../../widgets/products/edit_product/upload_image_edit_product.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProductController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: "Edit Product",
        automaticallyImplyLeading: true,
        onPressed: () {
          Get.back();
        },
      ),
      body: SafeArea(
          child: GetBuilder<EditProductController>(builder: (controller) {
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
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height42,
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                value: "1",
                                groupValue: controller.status,
                                onChanged: (value) {
                                  controller.changeStatusOfProduct(value);
                                },
                                title: TextApp(
                                  text: "active",
                                  fontSize: font14,
                                ),
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                value: "0",
                                groupValue: controller.status,
                                onChanged: (value) {
                                  controller.changeStatusOfProduct(value);
                                },
                                title: TextApp(
                                  text: "hidden",
                                  fontSize: font14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    sizeVertical(height20),
                    UploadImageOfEditProductWidget(
                      onTapUpload: () {
                        controller.showOptionToUploadImage(context);
                      },
                    ),
                    sizeVertical(height20),
                    Row(
                      children: [
                        FieldSectionWidget(
                          controller: controller.productNameController!,
                          title: '* Product Name EN',
                        ),
                        sizeHorizontal(width5),
                        FieldSectionWidget(
                          controller: controller.productNameFRController!,
                          title: '* Product Name FR',
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
                              controller.dropDownCategoryName!,
                          dropDownSelectedId: controller.dropDownCategoryId!,
                        ),
                      ],
                    ),
                    sizeVertical(height20),
                    Row(
                      children: [
                        FieldSectionWidget(
                          controller: controller.productDescriptionController!,
                          title: '* Product Description EN',
                        ),
                        sizeHorizontal(width5),
                        FieldSectionWidget(
                          controller:
                              controller.productDescriptionFRController!,
                          title: '* Product Description FR',
                        ),
                      ],
                    ),
                    sizeVertical(height20),
                    Row(
                      children: [
                        FieldSectionWidget(
                          controller: controller.productStockController!,
                          title: '* Product Stock',
                        ),
                        sizeHorizontal(width5),
                      ],
                    ),
                    sizeVertical(height20),
                    Row(
                      children: [
                        FieldSectionWidget(
                          controller: controller.productPriceController!,
                          title: '* Product Price',
                        ),
                        sizeHorizontal(width5),
                        FieldSectionWidget(
                          controller: controller.productDiscountController!,
                          title: '* Product Discount',
                        ),
                      ],
                    ),
                    sizeVertical(height20),
                    NavigationButtonWidget(
                      textButton: "Edit Product",
                      icon: Icons.edit,
                      onPressed: () {
                        controller.editProduct();
                      },
                    )
                  ],
                ))
              ],
            ),
          ),
        );
      })),
    );
  }
}
