import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../global/form_container.dart';
import '../global/text_app.dart';

class HeaderOfFilterSection extends StatelessWidget {
  final Function(String)? onChanged;
  final Function()? onSearch;
  final TextEditingController searchController;
  final String selectedDelivery;
  final Iterable<DropdownMenuItem<String>> deliveryItems;
  final void Function(String?) onChangedDrop;
  final String text;
  const HeaderOfFilterSection({super.key, this.onChanged, this.onSearch, required this.searchController, required this.selectedDelivery, required this.deliveryItems,required this.onChangedDrop, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: screenHeight * .045,
          width: screenWidth *.3,
          child: Center(
            child:TextApp(
              text: text,
              fontSize: font18,
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        sizeHorizontal(width10),
        Row(
          children: [
          Container(
          height: screenHeight * .045,
          width: screenWidth *.24,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey50!,width: 1),
            color: const Color(0xfff8f9fe),
            borderRadius: BorderRadius.circular(radius5),
          ),
          child: FormContainer(
            hintText: "Search",
            isSuffix: true,
            fillColor: const Color(0xfff8f9fe),
            isFilled: true,
            isPrefix: false,
            onSearch: onSearch,
            onChanged: onChanged,
            textColor: const Color(0xff898fac),
            suffixIconColor: const Color(0xff898fac),
            controller: searchController,
          ),
        ),
            sizeHorizontal(width5),
            Container(
              height: screenHeight * .045,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey50!,width: 1),
                color: const Color(0xfff8f9fe),
                borderRadius: BorderRadius.circular(radius5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width10),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      icon: Icon(Icons.filter_list_outlined,color: const Color(0xff898fac),size: font22,),
                      value: selectedDelivery,
                      items: deliveryItems.toList(),
                      onChanged: onChangedDrop),
                ),
              ),
            ),
          ],
        )

      ],
    );
  }
}
