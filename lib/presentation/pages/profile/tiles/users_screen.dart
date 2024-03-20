import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/profile/tiles/users/users_controller.dart';
import '../../../../core/class/handling_dataview.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/routes.dart';
import '../../../widgets/global/app_bar.dart';
import '../../../widgets/global/filter_icon_widget.dart';
import '../../../widgets/global/header_section.dart';
import '../../../widgets/orders/list_orders/not_found_order.dart';
import '../../../widgets/products/view_products/search_section_widget.dart';
import '../../../widgets/profile/users/list_users_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersProfileController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: "Users",
        automaticallyImplyLeading: true,
        onPressed: () => Get.back(),
      ),
      body: SafeArea(
          child: GetBuilder<UsersProfileController>(builder: (controller) {
        return Column(
          children: [
            HeaderSection(
              productsLength: controller.users.length,
              text: 'Users',
              textButton: "Add Product",
              onPressed: () {
                Get.toNamed(AppRoutes.addProduct);
              },
              isShow: false,
            ),
            SizedBox(
              height: height42,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * .85,
                    child: SearchSection(
                      onSearch: controller.onSearchUsers,
                      onChanged: (value) {
                        controller.checkValueUsers(value);
                      },
                      controller: controller.searchUsersController,
                      searchText: "Search Users",
                    ),
                  ),
                  sizeHorizontal(width5),
                  FilterIconWidget(onPressed: () {
                    controller.onChangeFilter();
                  }),
                ],
              ),
            ),
            controller.isSelected == false
                ? Container()
                : SizedBox(
                    height: screenHeight * .05,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: width10),
                      child: ListView.builder(
                        itemCount: controller.dropItems.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(right: width3),
                            child: ChoiceChip(
                              label: Text(
                                controller.dropItems[index],
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: font12,
                                    color: controller.choiceIndex == index
                                        ? Colors.white
                                        : const Color(0xff898fac)),
                              ),
                              selected: controller.choiceIndex == index,
                              selectedColor: AppColors.green,
                              checkmarkColor: AppColors.white,
                              onSelected: (value) {
                                controller.onSelectedChoiceFilter(value, index);
                              },
                              backgroundColor: AppColors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
            sizeVertical(height10),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return HandlingDataRequest(
                        statusRequest: controller.statusRequest,
                        widget: Column(
                          children: [
                            if (controller.choiceIndex == 0)
                              controller.users.isNotEmpty
                                  ? ListViewFilteredOfUsers(
                                      itemCount: controller.users.length,
                                      users: controller.users)
                                  : const NotFoundOrder(
                                      notFoundText: "The Users"),
                            if (controller.choiceIndex == 1)
                              controller.lastMonthUsers.isNotEmpty
                                  ? ListViewFilteredOfUsers(
                                      itemCount:
                                          controller.lastMonthUsers.length,
                                      users: controller.lastMonthUsers)
                                  : const NotFoundOrder(
                                      notFoundText: "The Users"),
                            if (controller.choiceIndex == 2)
                              controller.lastWeekUsers.isNotEmpty
                                  ? ListViewFilteredOfUsers(
                                      itemCount:
                                          controller.lastWeekUsers.length,
                                      users: controller.lastWeekUsers)
                                  : const NotFoundOrder(
                                      notFoundText: "The Users"),
                          ],
                        ));
                  }),
            )
          ],
        );
      })),
    );
  }
}
