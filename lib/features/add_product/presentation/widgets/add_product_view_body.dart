import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/functions/bar_massage.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/app_styles.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_from_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/custom_image_picker.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  late String code, name, description;
  late int expirationDate;
  late num price, caleries;
  File? imageFile;
  bool isFeaturedProduct = false;
  bool isOrignalProduct = false;
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
              CustomImagePicker(onChanged: (value) => imageFile = value),
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
                onSaved: (value) => price = num.parse(value!),
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              CustomTextFromField(
                onSaved: (value) => description = value!,
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 3,
              ),
              CustomTextFromField(
                onSaved: (value) => caleries = num.parse(value!),
                hintText: 'Product Calories',
                keyboardType: TextInputType.number,
              ),
              CustomTextFromField(
                onSaved: (value) => expirationDate = int.parse(value!),
                hintText: 'Product Expiration Date',
                keyboardType: TextInputType.number,
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
              Row(
                children: [
                  Checkbox(
                    value: isOrignalProduct,
                    onChanged:
                        (value) => setState(() => isOrignalProduct = value!),
                  ),
                  Text(
                    'Is Orignal Product ?',
                    style: AppStyles.textBold13(
                      context,
                    ).copyWith(color: AppColors.lightGrey),
                  ),
                ],
              ),
              CustomButton(
                title: 'Add Product',
                onPressed: () {
                  if (imageFile != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      AddProductEntity product = AddProductEntity(
                        reviews: [],
                        code: code,
                        name: name,
                        price: price,
                        description: description,
                        imageFile: imageFile!,
                        isFeaturedProduct: isFeaturedProduct,
                        expirationDate: expirationDate,
                        isOrignalProduct: isOrignalProduct,
                        calories: caleries,
                      );
                      context.read<AddProductCubit>().addProduct(product);
                    } else {
                      setState(
                        () => autovalidateMode = AutovalidateMode.always,
                      );
                    }
                  } else {
                    showSnackBar(context, 'Please Select Product Image');
                  }
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
