import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/data/model/favorite_model.dart';
import 'package:admin/presentation/widgets/users/historic_users/body/favorite_section/single_content_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controller/users/historic_users/historic_users_controller.dart';

class ListOfFavoritesWidget extends GetView<HistoricUsersController> {
  const ListOfFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoricUsersController());
    return SizedBox(
      width: double.infinity,
      height: screenHeight * .23,
      child: ListView.builder(
          itemCount: controller.favorites.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SingleContentOfFavoriteWidget(
              favorites: FavoriteModel.fromJson(controller.favorites[index]),
            );
          }),
    );
  }
}
