import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: TextButton.styleFrom(backgroundColor: AppColors.primaryColor),
      child: Text(text),
    );
  }
}
