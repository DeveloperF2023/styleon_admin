import 'package:admin/controller/products/view_products_controller.dart';
import 'package:admin/core/constants/api_constants.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/presentation/widgets/products/view_products/dialog/remove_product_dialog.dart';
import 'package:admin/presentation/widgets/products/view_products/grid_component/category_widget.dart';
import 'package:admin/presentation/widgets/products/view_products/grid_component/image_widget.dart';
import 'package:admin/presentation/widgets/products/view_products/grid_component/manage_button_widget.dart';
import 'package:admin/presentation/widgets/products/view_products/grid_component/product_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../data/model/products_model.dart';
import '../../../global/text_app.dart';
import 'discount_widget.dart';

class ContentOfProductAsGridView extends GetView<ViewProductController> {
  final ProductModel productModel;
  const ContentOfProductAsGridView({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    Get.put(ViewProductController());
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Hero(
                tag: "${productModel.productId}",
                child: GestureDetector(
                  onTap: () {},
                  child: ImageWidget(
                      productImage:
                          '${ApiConstants.IMAGE_ITEMS}/${productModel.productImage}'),
                ),
              ),
              productModel.productDiscount != 0
                  ? Positioned(
                      bottom: height5,
                      right: width5,
                      child: DiscountWidget(
                          productDiscount: '${productModel.productDiscount}%'))
                  : const SizedBox(
                      height: 0,
                      width: 0,
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
                          controller.goToEditProduct(productModel);
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
                                child: RemoveProductDialog(
                                  productModel: productModel,
                                ),
                              ));
                        },
                      ),
                    ],
                  )),
            ],
          ),
          sizeVertical(height5),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductInformationWidget(
                      countPrice: '\$${double.parse(productModel.countPrice!)}',
                      productName: '${productModel.productName}'),
                  CategoryWidget(categoryName: "${productModel.categoryName}"),
                ],
              ),
              productModel.productStatus == 0
                  ? Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.trashColor,
                          size: 10,
                        ),
                        sizeHorizontal(width3),
                        TextApp(
                          text: "Hidden",
                          fontSize: font12,
                          color: AppColors.textColor,
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.green,
                          size: 10,
                        ),
                        sizeHorizontal(width3),
                        TextApp(
                          text: "Active",
                          fontSize: font12,
                          color: AppColors.textColor,
                        )
                      ],
                    )
            ],
          )
        ]));
  }
}
