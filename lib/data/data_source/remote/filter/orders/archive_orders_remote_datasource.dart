import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfArchiveOrdersRemoteDataSource{
  CRUD crud;
  FilterOfArchiveOrdersRemoteDataSource(this.crud);
  filterOfArchive()async{
    var response = await crud.postData(ApiConstants.ARCHIVE_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}