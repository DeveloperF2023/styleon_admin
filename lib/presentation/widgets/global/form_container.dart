import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/constants/dimensions.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';

class FormContainer extends StatefulWidget {
  const FormContainer(
      {super.key,
      this.controller,
      this.fieldkey,
      this.isPasswordField,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.type,
      this.prefixIcon,
      this.isFilled = true,
      this.maxLines = 1,
      this.fillColor = Colors.white60,
      this.prefixIconColor = Colors.black38,
      this.onChanged,
      this.onSearch,
      this.isPrefix = true,
      this.isSuffix = true,
      this.textColor = Colors.black54,
      this.suffixIconColor = Colors.black38});
  final TextEditingController? controller;
  final Key? fieldkey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? type;
  final IconData? prefixIcon;
  final bool? isFilled;
  final bool? isPrefix;
  final bool? isSuffix;
  final int? maxLines;
  final Color? fillColor;
  final Color? prefixIconColor;
  final Function(String)? onChanged;
  final Function()? onSearch;
  final Color? textColor;
  final Color? suffixIconColor;
  @override
  State<FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldkey,
      controller: widget.controller,
      keyboardType: widget.type,
      cursorColor: AppColors.primaryColor,
      obscureText: widget.isPasswordField == true ? _obscureText : false,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      style: TextStyle(
          fontSize: font12,
          fontFamily: "Poppins",
          color: widget.textColor,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontFamily: "Poppins", color: widget.textColor, fontSize: font12),
        prefixIcon: widget.isPrefix == true
            ? Icon(
                widget.prefixIcon,
                size: 18,
              )
            : null,
        prefixIconColor:
            widget.isPrefix == true ? widget.prefixIconColor : Colors.white60,
        fillColor: widget.fillColor,
        filled: widget.isFilled,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.only(top: 20, left: 20),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1.5, color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1.5, color: Colors.transparent),
        ),
        suffixIcon: widget.isSuffix == true
            ? InkWell(
                onTap: widget.onSearch,
                child: Icon(
                  EneftyIcons.search_normal_2_outline,
                  color: widget.suffixIconColor,
                  size: font14,
                ),
              )
            : Container(
                height: 0,
                width: 0,
              ),
      ),
    );
  }
}
