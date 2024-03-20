import 'package:admin/data/model/brands_model.dart';
import 'package:admin/presentation/widgets/home/brands/content_brands.dart';
import 'package:admin/presentation/widgets/home/brands/search_brands_list.dart';
import 'package:admin/presentation/widgets/home/header_of_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';

class BrandListView extends StatelessWidget {
  const BrandListView({super.key});

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
            height: screenHeight * .27,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: Colors.grey.shade200, width: 2),
                borderRadius: BorderRadius.circular(radius10)),
            child: Column(
              children: [
                HeaderOfSection(
                  searchController: controller.searchBrandController,
                  onChanged: (value) {
                    controller.checkValueBrands(value);
                  },
                  onSearch: controller.onSearchBrands,
                  textSection: 'Brands List',
                ),
                Container(
                  height: screenHeight * .16,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width10),
                    child: !controller.isSearchBrands
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.brands.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return BrandsContent(
                                  brandsModel: BrandsModel.fromJson(
                                      controller.brands[index]));
                            })
                        : SearchOfBrandList(
                            brandList: controller.brandsList,
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
