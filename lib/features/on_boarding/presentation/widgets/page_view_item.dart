import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_e_commerce/constans.dart';
import 'package:fruits_e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruits_e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:fruits_e_commerce/features/on_boarding/data/models/onboarding_model.dart';

class PageViewItem extends StatelessWidget {
  final OnBoardingPageModel pageModel;
  final bool isVisible;
  final PageController pageController;
  const PageViewItem({
    super.key,
    required this.pageModel,
    required this.isVisible,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الجزء العلوي الذي يحتوي على الصورة والخلفية
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.48,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  pageModel.backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(child: SvgPicture.asset(pageModel.image)),
              ),
              // 3. زر تخطٍ يوضع فوق الخلفية مباشرة
              Positioned(
                top: 16,
                right: 16,
                child: Visibility(
                  visible: isVisible, // شروط الإظهار حسب الصفحة
                  child: GestureDetector(
                    onTap: () {
                      // pageController.animateToPage(
                      //   1, // رقم الصفحة التالية (Index 1)
                      //   duration: const Duration(milliseconds: 400),
                      //   curve: Curves.easeInOut,
                      // );
                      Prefs.setBool(kIsOnBoardingViewSeen, true);
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginView.routeName);
                    },
                    child: Text(
                      'تخطٍ',
                      style: AppTextStyles.regular13.copyWith(
                        color: const Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 54),

        // العنوان (Widget لتمرير RichText بألوان مختلفة)
        pageModel.title,
        const SizedBox(height: 24),

        // الوصف الفرعي
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            pageModel.subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold13.copyWith(color: Color(0xff4E5556)),
          ),
        ),
      ],
    );
  }
}
