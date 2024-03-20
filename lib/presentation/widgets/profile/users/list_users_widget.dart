import 'package:admin/data/model/users_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/dimensions.dart';
import 'content_user_widget.dart';

class ListViewFilteredOfUsers extends StatelessWidget {
  const ListViewFilteredOfUsers(
      {super.key, required this.itemCount, required this.users});
  final int itemCount;
  final List<UsersModel> users;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .8,
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return ContentOfUserWidget(
              usersModel: users[index],
            );
            //
          }),
    );
  }
}
