import 'dart:io';

import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class AddProductsRemoteDataSource {
  CRUD crud;
  AddProductsRemoteDataSource(this.crud);
  addProducts(Map data,File file) async {
    var response = await crud.addDataWithImageOne(ApiConstants.ADD_PRODUCT_URL,data,file);
    return response.fold((l) => l, (r) => r);
  }
  }
