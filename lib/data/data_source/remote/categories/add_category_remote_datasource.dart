import 'dart:io';

import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class AddCategoryRemoteDataSource {
  CRUD crud;
  AddCategoryRemoteDataSource(this.crud);
  addCategory(Map data,File file) async {
    var response = await crud.addDataWithImageOne(ApiConstants.ADD_CATEGORIES_URL,data,file);
    return response.fold((l) => l, (r) => r);
  }
  }
