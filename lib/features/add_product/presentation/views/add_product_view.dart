import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/functions/bar_massage.dart';
import 'package:fruit_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/get_it_sevices.dart';
import 'package:fruit_hub_dashboard/core/utils/app_styles.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = '/add_product';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AddProductCubit(
            imageRepo: getIt.get<ImageRepo>(),
            productRepo: getIt.get<ProductRepo>(),
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Product', style: AppStyles.textBold19(context)),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) {
            return BlocConsumer<AddProductCubit, AddProductState>(
              listener: (context, state) {
                if (state is AddProductError) {
                  showSnackBar(context, state.message);
                } else if (state is AddProductSuccess) {
                  showSnackBar(context, 'Product Added Successfully');
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is AddProductLoading,
                  child: const AddProductViewBody(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
