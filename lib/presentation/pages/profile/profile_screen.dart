import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/profile/profile_controller.dart';
import '../../../core/constants/colors.dart';
import '../../widgets/global/app_bar.dart';
import '../../widgets/profile/body/tile_features_widget.dart';
import '../../widgets/profile/header/personal_information_widget.dart';
import '../../widgets/profile/header/title_information_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: "Profile",
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Column(
        children: [
          PersonalInformationWidget(
              username: controller.username!, email: controller.email!),
          const TitleOfSectionWidget(),
          Container(
            width: double.infinity,
            color: AppColors.white,
            child: Column(
              children: [
                TileFeaturesWidget(
                  text: "Users",
                  icon: EneftyIcons.location_tick_outline,
                  onTap: () => controller.goToUsers(),
                ),
                const TileFeaturesWidget(
                    text: "About us", icon: EneftyIcons.info_circle_outline),
                TileFeaturesWidget(
                  text: "Log out",
                  icon: EneftyIcons.logout_outline,
                  onTap: () {
                    return controller.logOut();
                  },
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
