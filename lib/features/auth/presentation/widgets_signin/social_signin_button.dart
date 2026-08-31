import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce/core/utils/app_text_styles.dart';

class SocialSigninButton extends StatelessWidget {
  const SocialSigninButton({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed,
  });

  final String title;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFDDDFDF), width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(image),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold16.copyWith(
              color: const Color(0xFF0C0D0D),
            ),
          ),
        ),
      ),
    );
  }
}
