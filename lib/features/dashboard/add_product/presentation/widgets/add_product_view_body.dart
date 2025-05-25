import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/app_styles.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_from_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late String code, name, price, description;
  bool isFeaturedProduct = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 8,
            children: [
              CustomTextFromField(
                onSaved: (value) => code = value!.toLowerCase(),
                hintText: 'Product Code',
                keyboardType: TextInputType.text,
              ),
              CustomTextFromField(
                onSaved: (value) => name = value!,
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),
              CustomTextFromField(
                onSaved: (value) => price = value!,
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              CustomTextFromField(
                onSaved: (value) => description = value!,
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 3,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isFeaturedProduct,
                    onChanged:
                        (value) => setState(() => isFeaturedProduct = value!),
                  ),
                  Text(
                    'Is Featured Product ?',
                    style: AppStyles.textBold13(
                      context,
                    ).copyWith(color: AppColors.lightGrey),
                  ),
                ],
              ),
              CustomButton(
                title: 'Add Product',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    setState(() => autovalidateMode = AutovalidateMode.always);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
