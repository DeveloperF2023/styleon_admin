import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../global/form_container.dart';

class HeaderOfSection extends StatelessWidget {
  final Function(String)? onChanged;
  final Function()? onSearch;
  final TextEditingController searchController;
  final String textSection;
  final bool? isPadding;
  const HeaderOfSection({super.key, this.onChanged, this.onSearch, required this.searchController, required this.textSection, this.isPadding = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:isPadding == false ? EdgeInsets.symmetric(vertical: height20,horizontal: width10):EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextApp(
            text: textSection,
            fontSize: font18,
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
          Row(
            children: [
              Container(
                height: screenHeight * .045,
                width: screenWidth*.35,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey50!,width: 1),
                  color: const Color(0xfff8f9fe),
                  borderRadius: BorderRadius.circular(radius5),
                ),
                child: FormContainer(
                  hintText: "Search",
                  isSuffix: true,
                  fillColor: Color(0xfff8f9fe),
                  isFilled: true,
                  isPrefix: false,
                  onSearch: onSearch,
                  onChanged: onChanged,
                  controller: searchController,
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}
