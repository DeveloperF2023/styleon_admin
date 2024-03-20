import 'package:admin/controller/categories/view_categories_controller.dart';
import 'package:admin/core/constants/api_constants.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:admin/presentation/widgets/products/view_products/grid_component/image_widget.dart';
import 'package:admin/presentation/widgets/products/view_products/grid_component/manage_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../dialog/remove_dialog.dart';
import 'categories_information_widget.dart';

class ContentOfCategoriesAsGridView extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const ContentOfCategoriesAsGridView(
      {super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewCategoriesController());
    return GetBuilder<ViewCategoriesController>(builder: (controller) {
      return Container(
          height: screenHeight * .2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ImageWidget(
                      productImage:
                          '${ApiConstants.IMAGE_CATEGORIES}/${categoriesModel.categoryImage}'),
                ),
                Positioned(
                    top: height5,
                    right: width5,
                    child: Row(
                      children: [
                        ManagementButtonWidget(
                          icon: Icons.edit,
                          color: AppColors.primaryColor,
                          iconColor: AppColors.white,
                          onTap: () {
                            controller.goToEditCategory(categoriesModel);
                          },
                        ),
                        sizeHorizontal(width5),
                        ManagementButtonWidget(
                          icon: Icons.delete_outline,
                          color: AppColors.white,
                          iconColor: AppColors.textColor!,
                          onTap: () {
                            Get.dialog(
                                barrierDismissible: false,
                                Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: RemoveDialog(
                                    categoriesModel: categoriesModel,
                                  ),
                                ));
                          },
                        ),
                      ],
                    )),
              ],
            ),
            sizeVertical(height5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoriesInformationWidget(
                    categoryDate:
                        "On ${DateFormat("MMMd").format(DateTime.parse("${categoriesModel.createdAt}"))}",
                    categoryName: '${categoriesModel.categoryName}'),
              ],
            )
          ]));
    });
  }
}
