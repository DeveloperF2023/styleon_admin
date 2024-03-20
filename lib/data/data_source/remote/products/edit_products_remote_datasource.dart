import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../core/enum/status_request.dart';

class EditProductsRemoteDataSource {
  CRUD crud;
  EditProductsRemoteDataSource(this.crud);
  editProducts(Map data, [File? file]) async {
    Either<StatusRequest, Map> response;
    if(file == null){
      response = await crud.postData(ApiConstants.EDIT_PRODUCT_URL, data);
    }else{
      response = await crud.addDataWithImageOne(ApiConstants.EDIT_PRODUCT_URL, data,file);
    }

    return response.fold((l) => l, (r) => r);
  }
}
