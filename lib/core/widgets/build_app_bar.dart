import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_styles.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(title, style: AppStyles.textBold19(context)),
      centerTitle: true,
    );
  }