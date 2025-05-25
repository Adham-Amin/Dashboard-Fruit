import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/app_styles.dart';


class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.onSaved, this.maxLines = 1,
  });

  final int maxLines;
  final String hintText;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: (value) => value!.isEmpty ? "faild is required" : null,
      onSaved: onSaved,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundTF,
        hintText: hintText,
        hintStyle: AppStyles.textBold13(
          context,
        ).copyWith(color: AppColors.lightGrey),
        border: customOutlineBorder(),
        enabledBorder: customOutlineBorder(),
        focusedBorder: customOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder customOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: AppColors.lightBorder),
    );
  }
}