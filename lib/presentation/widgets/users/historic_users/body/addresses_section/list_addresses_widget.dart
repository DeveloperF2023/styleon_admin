import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/data/model/address_model.dart';
import 'package:admin/presentation/widgets/users/historic_users/body/addresses_section/single_content_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/users/historic_users/historic_users_controller.dart';

class ListOfAddressesWidget extends GetView<HistoricUsersController> {
  const ListOfAddressesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoricUsersController());
    return SizedBox(
      width: double.infinity,
      height: screenHeight * .1,
      child: ListView.builder(
          itemCount: controller.addresses.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SingleContentOfAddress(
              addressModel: AddressModel.fromJson(controller.addresses[index]),
            );
          }),
    );
  }
}
