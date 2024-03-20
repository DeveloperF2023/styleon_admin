import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class DropDownSection extends StatelessWidget {
  const DropDownSection({super.key, this.selectedProducts, required this.dropItems, required this.onChangedDrop});
 final String? selectedProducts;
 final List<String> dropItems;
 final void Function(String?) onChangedDrop;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * .045,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey50!,width: 1),
        color:AppColors.fillColor,
        borderRadius: BorderRadius.circular(radius5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              icon: Icon(Icons.arrow_drop_down,color: const Color(0xff898fac),size: font22,),
              value: selectedProducts,
              items: dropItems
                  .map((value) => DropdownMenuItem<String>(
                value: value,
                child: TextApp(
                  text: value,
                  color: const Color(0xff898fac),
                  fontSize: font14,
                ),
              )).toList(),
              onChanged: onChangedDrop),
        ),
      ),
    );
  }
}
