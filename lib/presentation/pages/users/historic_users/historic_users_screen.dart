import 'package:admin/controller/users/historic_users/historic_users_controller.dart';
import 'package:admin/core/class/handling_dataview.dart';
import 'package:admin/data/model/users_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../widgets/users/historic_users/body/addresses_section/address_content_widget.dart';
import '../../../widgets/users/historic_users/body/favorite_section/favorite_content_widget.dart';
import '../../../widgets/users/historic_users/body/orders_section/orders_container_section.dart';
import '../../../widgets/users/historic_users/body/user_information_section/user_information_widget.dart';
import '../../../widgets/users/historic_users/header/header_user_information.dart';

class HistoricUsersScreen extends StatelessWidget {
  const HistoricUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoricUsersController());
    return GetBuilder<HistoricUsersController>(builder: (controller) {
      return Scaffold(
        backgroundColor: const Color(0xfff3f6fb),
        body: SafeArea(
            child: HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    HeaderUserInformation(
                      username: controller.getInitials(
                          string: controller.username!.toUpperCase(),
                          limitTo: 1),
                    ),
                    sizeVertical(height10),
                    Flexible(
                      child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ...List.generate(
                                    controller.users.length,
                                    (index) => UserInformationWidget(
                                          usersModel: UsersModel.fromJson(
                                              controller.users[index]),
                                        )),
                                sizeVertical(height10),
                                OrdersContentWidget(),
                                sizeVertical(height10),
                                FavoriteContentWidget(),
                                sizeVertical(height10),
                                AddressesContentWidget(),
                              ],
                            );
                          }),
                    )
                  ],
                ))),
      );
    });
  }
}
