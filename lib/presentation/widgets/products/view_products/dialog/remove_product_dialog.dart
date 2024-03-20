import 'package:admin/controller/products/view_products_controller.dart';
import 'package:admin/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/categories/view_categories_controller.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../data/model/category_model.dart';
import '../../../global/text_app.dart';

class RemoveProductDialog extends StatelessWidget {
  final ProductModel productModel;
  const RemoveProductDialog({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewProductController());
    return GetBuilder<ViewProductController>(builder: (controller){
      return WillPopScope(
        onWillPop: () async => false,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius10)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: TextApp(text: "Delete ${productModel.productName}",fontSize: font16,color: AppColors.textColor,),
                ),
                sizeVertical(height10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width10),
                  child: Text("Do you want to remove ${productModel.productName}",),
                ),
                sizeVertical(height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: (){
                          Get.back();
                        },
                        style: TextButton.styleFrom(
                            side: BorderSide(color: AppColors.textColor!),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(radius5)
                            )
                        ),
                        child: TextApp(text: "Cancel",fontSize: font14,color: AppColors.textColor,)),
                    sizeHorizontal(width10),
                    TextButton(
                        onPressed: (){
                          controller.deleteProduct(productModel.productId.toString(), productModel.productImage!);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(radius5),
                            )
                        ),
                        child: TextApp(text: "Remove",fontSize: font14,color: AppColors.white,))
                  ],
                ),

              ],
            ),
          ),
        ),
      );
    });
  }
}
