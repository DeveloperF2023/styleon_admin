import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';

class SearchOfDropDownList extends StatelessWidget {
  final String title;
  final List<SelectedListItem> categories;
  final TextEditingController dropDownSelectedName;
  final TextEditingController dropDownSelectedId;
  const SearchOfDropDownList({super.key, required this.title, required this.categories, required this.dropDownSelectedName, required this.dropDownSelectedId});

  @override
  Widget build(BuildContext context) {
    void dropDownSearch(){
      return DropDownState(
        DropDown(
          dropDownBackgroundColor: AppColors.white,
          bottomSheetTitle: Padding(
            padding: EdgeInsets.symmetric(horizontal: width10,vertical: height10),
            child: TextApp(
              text: title,
              fontSize: font16,
              color: AppColors.textColor,
            ),
          ),
          submitButtonChild: const Text(
            'Done',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins"
            ),
          ),
          data: categories,
          selectedItems: (List<dynamic> selectedList) {
            SelectedListItem selectedListItem = selectedList[0];
            dropDownSelectedName.text = selectedListItem.name;
            dropDownSelectedId.text = selectedListItem.value!;
          },
          enableMultipleSelection: false,
        ),
      ).showModal(context);
    }
    return TextFormField(
      controller: dropDownSelectedName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        dropDownSearch();
      },
      style: TextStyle(
          fontSize: font12,
          color: AppColors.textColor,
          fontFamily: "Poppins"
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText:dropDownSelectedName.text == ""? "Choose Category":dropDownSelectedName.text,
        hintStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: font12,
            color: AppColors.textColor
        ),
        contentPadding: const EdgeInsets.only(left: 20, bottom: 0, top: 0, right: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius:  BorderRadius.all(Radius.circular(radius5)),
          borderSide: BorderSide(width: 1.5, color: AppColors.subtitleColor!),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius5)),
          borderSide: BorderSide(width: 1.5, color: AppColors.subtitleColor!),
        ),
      ),
    );
  }
}
