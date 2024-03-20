import 'package:admin/controller/users/historic_users/historic_users_controller.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/data/model/users_model.dart';
import 'package:admin/presentation/widgets/users/historic_users/body/user_information_section/username_email_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInformationWidget extends GetView<HistoricUsersController> {
  final UsersModel usersModel;
  const UserInformationWidget({super.key, required this.usersModel});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoricUsersController());
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UsernameAndEmailOfUserWidget(
                username: usersModel.username!,
                email: usersModel.email!,
                phone: usersModel.phone!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
