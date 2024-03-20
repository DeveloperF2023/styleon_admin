import 'dart:io';

import 'package:admin/controller/categories/view_categories_controller.dart';
import 'package:admin/controller/home/categories/categories_controller.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/core/functions/upload_image.dart';
import 'package:admin/data/data_source/remote/categories/add_category_remote_datasource.dart';
import 'package:admin/data/data_source/remote/products/add_products_remote_datasource.dart';
import 'package:admin/data/data_source/remote/products/fetch_products_remote_datasource.dart';
import 'package:admin/presentation/pages/categories/categories_screen.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handling_data.dart';

class AddCategoriesController extends GetxController {
  TextEditingController? categoryNameController;
  TextEditingController? categoryNameFRController;
  File? file;
  AddCategoryRemoteDataSource addCategoryRemoteDataSource =
      AddCategoryRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formStateCategory = GlobalKey<FormState>();

  chooseImage() async {
    file = await uploadFileFromGallery();
    update();
  }
  onTapBack(){
    ViewCategoriesController categoriesController = Get.find();
    categoriesController.viewCategories();
    Get.offNamed(AppRoutes.categories);
  }
  addCategory() async {
    if (formStateCategory.currentState!.validate()) {
      if (file == null) {
        Get.snackbar(
          "Error Upload Image",
          "Please upload image",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          borderRadius: radius5,
          backgroundColor: Colors.grey.shade50,
        );
      }
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "categoryNameEn": categoryNameController!.text,
        "categoryNameFR": categoryNameFRController!.text,
      };
      var response = await addCategoryRemoteDataSource.addCategory(data, file!);
      statusRequest = handlingData(response);
      print(
          "------------------------------------------------------------------------ Controller $response");
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.rawSnackbar(
            backgroundColor: AppColors.grey50!,
            duration: const Duration(seconds: 7),
              messageText: TextApp(
                text:
                    "The Category ${categoryNameController!.text} added successfully",
                color: AppColors.textColor,
              ),
              titleText: TextApp(
                text: "Add Category",
                color: AppColors.textColor,
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

  @override
  void onInit() {
    categoryNameController = TextEditingController();
    categoryNameFRController = TextEditingController();
    super.onInit();
  }
}
