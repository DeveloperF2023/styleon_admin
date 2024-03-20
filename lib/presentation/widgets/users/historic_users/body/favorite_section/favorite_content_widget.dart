import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';
import 'list_favorite_widget.dart';

class FavoriteContentWidget extends StatelessWidget {
  const FavoriteContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius5),
                color: Colors.white),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width10, vertical: height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextApp(
                        text: "Favorites",
                        fontSize: font18,
                        color: AppColors.textColor,
                      ),
                    ],
                  ),
                  sizeVertical(height10),
                  ListOfFavoritesWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
