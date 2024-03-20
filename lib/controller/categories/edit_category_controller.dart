import 'dart:io';

import 'package:admin/controller/categories/view_categories_controller.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/data/data_source/remote/categories/edit_category_remote_datasource.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/dimensions.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handling_data.dart';
import '../../core/functions/upload_image.dart';
import '../../presentation/widgets/global/text_app.dart';

class EditCategoryController extends GetxController {
  EditCategoriesRemoteDataSource editCategoriesRemoteDataSource =
      EditCategoriesRemoteDataSource(Get.find());
  late CategoriesModel categoriesModel;
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryNameFRController = TextEditingController();
  GlobalKey<FormState> formStateCategory = GlobalKey<FormState>();
  File? file;
  String? imageOld;

  chooseImage() async {
    file = await uploadFileFromGallery();
    print("this is file $file");
    update();
  }

  editCategory() async {
    if (formStateCategory.currentState!.validate()) {
      if (file!.lengthSync() > 30000000) {
        Get.snackbar(
          "Error Upload Image",
          "The max of file be less than 2MB",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          borderRadius: radius5,
          backgroundColor: Colors.grey.shade50,
        );
        print(file!.lengthSync());
      } else {
        statusRequest = StatusRequest.loading;
        update();
        Map data = {
          "categoryId": categoriesModel.categoryId.toString(),
          "categoryNameEn": categoryNameController.text,
          "categoryNameFR": categoryNameFRController.text,
          "imageOld": categoriesModel.categoryImage,
        };
        var response =
            await editCategoriesRemoteDataSource.editCategories(data, file);
        statusRequest = handlingData(response);
        print(
            "------------------------------------------------------------------------ Controller $response");
        print(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Get.rawSnackbar(
              backgroundColor: AppColors.textColor!,
              titleText: TextApp(
                text:
                    "The Category ${categoryNameController.text} edited successfully",
                fontSize: font14,
                color: AppColors.white,
              ),
              messageText: TextApp(
                text: "Add Category",
                fontSize: font14,
                color: AppColors.white,
              ),
            );
            ViewCategoriesController categoriesController = Get.find();
            categoriesController.viewCategories();
            Get.offNamed(AppRoutes.categories);
          } else {
            statusRequest = StatusRequest.failure;
          }
        }
      }
    }
  }

  @override
  void onInit() {
    categoriesModel = Get.arguments['categoriesModel'];
    categoryNameController =
        TextEditingController(text: categoriesModel.categoryName);
    categoryNameFRController =
        TextEditingController(text: categoriesModel.categoryNameFr);
    imageOld = categoriesModel.categoryImage;
    print("this is image old $imageOld}");
    super.onInit();
  }
}
