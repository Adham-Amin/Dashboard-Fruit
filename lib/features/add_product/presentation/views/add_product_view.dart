import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_styles.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = '/add_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product', style: AppStyles.textBold19(context)),
        centerTitle: true,
      ),
      body: const AddProductViewBody(),
    );
  }
}
