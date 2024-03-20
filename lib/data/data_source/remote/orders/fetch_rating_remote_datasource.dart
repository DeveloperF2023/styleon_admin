import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class ViewRatingRemoteDataSource {
  CRUD crud;
  ViewRatingRemoteDataSource(this.crud);
  fetchRating() async {
    var response = await crud.postData(ApiConstants.FETCH_RATING_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
