import 'dart:io';

import 'package:admin/controller/products/view_products_controller.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/data/data_source/remote/products/edit_products_remote_datasource.dart';
import 'package:admin/data/model/products_model.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/bottom_sheet_choose_image.dart';
import '../../core/functions/handling_data.dart';
import '../../core/functions/upload_image.dart';
import '../../data/data_source/remote/categories/fetch_categories_remote_datasource.dart';
import '../../data/model/category_model.dart';

class EditProductController extends GetxController {
  EditProductsRemoteDataSource editProductsRemoteDataSource =
      EditProductsRemoteDataSource(Get.find());
  ProductModel? productModel;
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? productNameController;
  TextEditingController? dropDownCategoryId;
  TextEditingController? dropDownCategoryName;
  TextEditingController? productNameFRController;
  TextEditingController? productDescriptionController;
  TextEditingController? productDescriptionFRController;
  TextEditingController? productStockController;
  TextEditingController? productPriceController;
  TextEditingController? productDiscountController;
  ViewCategoriesRemoteDataSource viewCategoriesRemoteDataSource =
      ViewCategoriesRemoteDataSource(Get.find());
  String? imageOld;
  List<CategoriesModel> categories = [];
  List<SelectedListItem> dropDownCategories = [];
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  File? file;
  String? status;

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

  editProduct() async {
    statusRequest = StatusRequest.loading;
    Map data = {
      "productId": productModel!.productId.toString(),
      "productNameEn": productNameController!.text,
      "productNameFR": productNameFRController!.text,
      "productDescription": productDescriptionController!.text,
      "productDescriptionFr": productDescriptionFRController!.text,
      "productStock": productStockController!.text,
      "productPrice": productPriceController!.text,
      "productDiscount": productDiscountController!.text,
      "productCategory": dropDownCategoryId!.text,
      "productStatus": status,
      "dateNow": DateFormat("yyyy-MM-dd H:s").format(DateTime.now()),
      "imageOld": imageOld,
    };
    var response = await editProductsRemoteDataSource.editProducts(data, file);
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
                "The Product ${productNameController!.text} edited successfully",
            color: AppColors.white,
          ),
          titleText: TextApp(
            text: "Edit Product",
            color: AppColors.white,
          ),
        );
        ViewProductController productController = Get.find();
        productController.viewProducts();
        Get.offNamed(AppRoutes.product);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  changeStatusOfProduct(value) {
    status = value;
    update();
  }

  @override
  void onInit() {
    productModel = Get.arguments['productModel'];
    viewCategories();
    productNameController =
        TextEditingController(text: productModel!.productName);
    productNameFRController =
        TextEditingController(text: productModel!.productNameFr);
    productDescriptionController =
        TextEditingController(text: productModel!.productDesc);
    productDescriptionFRController =
        TextEditingController(text: productModel!.productDescFr);
    productStockController =
        TextEditingController(text: productModel!.productStock.toString());
    productPriceController =
        TextEditingController(text: productModel!.productPrice.toString());
    productDiscountController =
        TextEditingController(text: productModel!.productDiscount.toString());
    dropDownCategoryId =
        TextEditingController(text: productModel!.productCategory.toString());
    dropDownCategoryName =
        TextEditingController(text: productModel!.categoryName.toString());
    imageOld = productModel!.productImage;
    status = productModel!.productStatus.toString();
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
