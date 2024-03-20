import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/form_container.dart';

class SearchSection extends StatelessWidget {
  const SearchSection(
      {super.key,
      required this.onSearch,
      required this.onChanged,
      required this.controller,
      required this.searchText});
  final Function() onSearch;
  final Function(String) onChanged;
  final TextEditingController controller;
  final String searchText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: Container(
        height: screenHeight * .045,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey50!, width: 1),
          color: const Color(0xfff8f9fe),
          borderRadius: BorderRadius.circular(radius5),
        ),
        child: FormContainer(
          hintText: searchText,
          isSuffix: true,
          fillColor: AppColors.fillColor,
          isFilled: true,
          isPrefix: false,
          onSearch: onSearch,
          onChanged: onChanged,
          textColor: const Color(0xff898fac),
          suffixIconColor: const Color(0xff898fac),
          controller: controller,
        ),
      ),
    );
  }
}
