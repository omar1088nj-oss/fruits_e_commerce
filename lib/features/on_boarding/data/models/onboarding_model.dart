import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/utils/app_colors.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';
import 'package:fruits_e_commerce/core/utils/app_text_styles.dart';

class OnBoardingPageModel {
  final String image;
  final String backgroundImage; // الصورة الخلفية إن وجدت
  final Widget title;
  final String subtitle;

  OnBoardingPageModel({
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
  });
}

final List<OnBoardingPageModel> onBoardingPages = [
  // الصفحة الأولى
  OnBoardingPageModel(
    image: Assets.imagesFruits,
    backgroundImage: Assets.imagesPage1Background,
    title: const Text.rich(
      TextSpan(
        style: AppTextStyles.bold23,
        children: [
          TextSpan(text: 'مرحبًا بك في '),

          TextSpan(
            text: 'Fruit',
            style: TextStyle(color: AppColors.primaryColor),
          ),
          TextSpan(
            text: 'HUB',
            style: TextStyle(color: AppColors.secondaryColor),
          ),
        ],
      ),
    ),

    subtitle:
        'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
  ),

  // الصفحة الثانية
  OnBoardingPageModel(
    image: Assets.imagesPineapple,
    backgroundImage: Assets.imagesPage2Background,
    title: const Text('ابحث وتسوق', style: AppTextStyles.bold23),
    subtitle:
        'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية.',
  ),
];
