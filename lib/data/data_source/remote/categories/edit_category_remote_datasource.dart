import 'dart:io';

import 'package:admin/core/enum/status_request.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class EditCategoriesRemoteDataSource {
  CRUD crud;
  EditCategoriesRemoteDataSource(this.crud);
  editCategories(Map data, [File? file]) async {
    Either<StatusRequest, Map> response;
    if(file == null){
      response = await crud.postData(ApiConstants.EDIT_CATEGORIES_URL, data);
    }else{
      response = await crud.addDataWithImageOne(ApiConstants.EDIT_CATEGORIES_URL, data,file);
    }

    return response.fold((l) => l, (r) => r);
  }
}
