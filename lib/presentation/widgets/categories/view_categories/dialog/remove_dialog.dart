import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/categories/view_categories_controller.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../../../data/model/category_model.dart';
import '../../../global/text_app.dart';

class RemoveDialog extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const RemoveDialog({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewCategoriesController());
    return GetBuilder<ViewCategoriesController>(builder: (controller){
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
                  child: TextApp(text: "Delete ${categoriesModel.categoryName}",fontSize: font16,color: AppColors.textColor,),
                ),
                sizeVertical(height10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width10),
                  child: Text("Do you want to remove ${categoriesModel.categoryName}",),
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
                          controller.deleteCategory(categoriesModel.categoryId.toString(), categoriesModel.categoryImage.toString());
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
