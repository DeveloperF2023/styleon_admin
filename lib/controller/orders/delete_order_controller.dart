import 'package:admin/core/enum/status_request.dart';
import 'package:admin/data/data_source/remote/products/delete_products_remote_datasource.dart';
import 'package:admin/data/data_source/remote/products/fetch_products_remote_datasource.dart';
import 'package:admin/data/model/products_model.dart';
import 'package:get/get.dart';
import '../../core/functions/handling_data.dart';

class DeleteOrderController extends GetxController{
  DeleteProductsRemoteDataSource deleteProductsRemoteDataSource = DeleteProductsRemoteDataSource(Get.find());
  List<ProductModel> products = [];
  StatusRequest statusRequest = StatusRequest.none;


  deleteProduct(String productId, String imageName){
  deleteProductsRemoteDataSource.deleteProducts(productId, imageName);
  products.removeWhere((element) => element.productId.toString() == productId);
  update();
  }
}