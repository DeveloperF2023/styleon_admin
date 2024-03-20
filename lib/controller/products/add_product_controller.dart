import 'dart:io';

import 'package:admin/controller/products/view_products_controller.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/core/functions/bottom_sheet_choose_image.dart';
import 'package:admin/core/functions/upload_image.dart';
import 'package:admin/data/data_source/remote/products/add_products_remote_datasource.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handling_data.dart';
import '../../data/data_source/remote/categories/fetch_categories_remote_datasource.dart';

class AddProductController extends GetxController {
  TextEditingController? productNameController;
  TextEditingController? dropDownCategoryNameController;
  TextEditingController? dropDownCategoryIDController;
  TextEditingController? categoryNameController;
  TextEditingController? categoryIDController;
  TextEditingController? productNameFRController;
  TextEditingController? productDescriptionController;
  TextEditingController? productDescriptionFRController;
  TextEditingController? productStockController;
  TextEditingController? productPriceController;
  TextEditingController? productDiscountController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ViewCategoriesRemoteDataSource viewCategoriesRemoteDataSource =
      ViewCategoriesRemoteDataSource(Get.find());
  List<CategoriesModel> categories = [];
  List<SelectedListItem> dropDownCategories = [];
  String? categoryId;
  bool? isProductSelected;
  bool isCategory = false;
  File? file;
  AddProductsRemoteDataSource addProductsRemoteDataSource =
      AddProductsRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  chooseImage() async {
    file = await uploadFileFromGallery();
    update();
  }

  chooseImageFromCamera() async {
    file = await uploadImageFromCamera();
    update();
  }

  chooseImageFromGallery() async {
    file = await uploadFileFromGallery();
    update();
  }

  addProduct() async {
    if (formState.currentState!.validate()) {
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
        "productNameEn": productNameController!.text,
        "productNameFR": productNameFRController!.text,
        "productDescription": productDescriptionController!.text,
        "productDescriptionFr": productDescriptionFRController!.text,
        "productStock": productStockController!.text,
        "productPrice": productPriceController!.text,
        "productDiscount": productDiscountController!.text,
        "productCategory": categoryIDController!.text,
        "dateNow": DateFormat("yyyy-MM-dd H:s").format(DateTime.now())
      };
      var response = await addProductsRemoteDataSource.addProducts(data, file!);
      statusRequest = handlingData(response);
      print(
          "------------------------------------------------------------------------ Controller $response");
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.rawSnackbar(
            backgroundColor: AppColors.textColor!,
            duration: const Duration(seconds: 7),
            messageText: TextApp(
              text:
                  "The Product ${productNameController!.text} added successfully",
              color: AppColors.white,
            ),
            titleText: TextApp(
              text: "Add Product",
              color: AppColors.white,
            ),
          );
          ViewProductController productController = Get.find();
          productController.viewProducts();
          Get.offNamed(AppRoutes.product);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }
  }

  @override
  void onInit() {
    viewCategories();
    productNameController = TextEditingController();
    productNameFRController = TextEditingController();
    productDescriptionController = TextEditingController();
    productDescriptionFRController = TextEditingController();
    productStockController = TextEditingController();
    productPriceController = TextEditingController();
    productDiscountController = TextEditingController();
    dropDownCategoryNameController = TextEditingController();
    dropDownCategoryIDController = TextEditingController();
    categoryNameController = TextEditingController();
    categoryIDController = TextEditingController();
    super.onInit();
  }

  showOptionToUploadImage(BuildContext context) {
    bottomSheetToChooseImage(
        context, chooseImageFromCamera, chooseImageFromGallery);
  }

  viewCategories() async {
    categories.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCategoriesRemoteDataSource.fetchCategories();
    statusRequest = handlingData(response);
    print("-------------View Categories-----\n $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        categories.addAll(responseData.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < categories.length; i++) {
          dropDownCategories.add(SelectedListItem(
              name: categories[i].categoryName!,
              value: categories[i].categoryId.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
}
