import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/on_boarding/data/models/onboarding_model.dart';
import 'package:fruits_e_commerce/features/on_boarding/presentation/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController pageController;

  const OnBoardingPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: onBoardingPages.length, // عدد الصفحات (2)
      itemBuilder: (context, index) {
        return PageViewItem(
          pageModel: onBoardingPages[index],
          isVisible: index == 0 ? true : false,
          pageController: pageController,
        );
      },
    );
  }
}
