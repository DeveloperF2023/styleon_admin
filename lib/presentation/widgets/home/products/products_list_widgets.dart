import 'package:admin/presentation/widgets/global/form_container.dart';
import 'package:admin/presentation/widgets/home/products/products_content.dart';
import 'package:admin/presentation/widgets/home/products/search_list_products.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../data/model/products_model.dart';
import '../../global/text_app.dart';
import 'header_products.dart';
import 'low_price_product_content.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: width5),
        child: Card(
          surfaceTintColor: AppColors.textColor,
          color: AppColors.textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius10)),
          child: Container(
            height: screenHeight * .42,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: Colors.grey.shade200, width: 2),
                borderRadius: BorderRadius.circular(radius10)),
            child: Column(
              children: [
                HeaderOfProducts(
                    searchController: controller.searchController,
                    selectedProducts: controller.productsController.selectedProducts,
                    items: controller.productsController.dropProducts
                        .map((value) => DropdownMenuItem<String>(
                              value: value,
                              child: TextApp(
                                text: value,
                                color: const Color(0xff898fac),
                                fontSize: font14,
                              ),
                            )),
                    onChangedDrop: (value) {
                      controller.onChangedProducts(value!);
                      print(value);
                    },
                  onChanged: (value) {
                    controller.checkValue(value);
                  },
                  onSearch: controller.onSearchProducts,
                ),

                SizedBox(
                  height: screenHeight * .31,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width10),
                    child: !controller.isSearch
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.items.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (controller.productsController.selectedProducts == "All") {
                                return ProductContent(
                                  productModel: ProductModel.fromJson(
                                      controller.items[index]),
                                );
                              } else if (controller.productsController.selectedProducts ==
                                  "Low Price") {
                                return LowPriceProductContent(
                                  productModel: ProductModel.fromJson(
                                      controller.productsController.lowPriceProducts[index]),
                                );
                              } else if (controller.productsController.selectedProducts ==
                                  "High Price") {
                                return LowPriceProductContent(
                                  productModel: ProductModel.fromJson(
                                      controller.productsController.highPriceProducts[index]),
                                );
                              }
                              return const CircularProgressIndicator();
                            })
                        : SearchListOfProducts(
                            searchList: controller.searchList,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
