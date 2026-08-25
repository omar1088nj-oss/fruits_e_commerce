import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: () {
        //Navigator.pop(context)
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bold19),
  );
}
