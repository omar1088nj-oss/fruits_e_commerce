import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fruits_e_commerce/constans.dart';
import 'package:fruits_e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_e_commerce/core/utils/app_colors.dart';
import 'package:fruits_e_commerce/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_e_commerce/features/on_boarding/data/models/onboarding_model.dart';
import 'package:fruits_e_commerce/features/on_boarding/presentation/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  // 1. تعريف المتغيرات
  late PageController pageController;
  int currentPage = 0; // يتابع رقم الصفحة الحالية (0 أو 1)

  @override
  void initState() {
    super.initState();
    // 2. تهيئة الـ Controller وتعيين المستمع (Listener)
    pageController = PageController();

    // الاستماع للتغيرات أثناء سحب الشاشة بالأصبع
    pageController.addListener(() {
      setState(() {
        // round() تحول الكسر إلى رقم صحيح (مثلاً 0.8 تصبح 1)
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    // 3. تنظيف الـ Controller من الذاكرة عند الخروج من الشاشة
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- 2. الجزء المتحرك (PageView) ---
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController, // تمرير الريموت للـ PageView
          ),
        ),

        // --- 3. مؤشر النقاط ---
        DotsIndicator(
          dotsCount: onBoardingPages.length,
          position: currentPage.toDouble(), // يأخذ رقم الصفحة ليغير لون النقطة
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 0
                ? AppColors.primaryColor.withOpacity(0.3)
                : AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 29),

        // --- 4. الزر السفلي (ابدأ الآن) ---
        Visibility(
          visible: currentPage == 1, // يظهر فقط في الصفحة الثانية والأخيرة
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 54, // الارتفاع القياسي للزر في Figma
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  // اللون الأخضر الداكن
                  foregroundColor: Colors.white, // لون النص
                  elevation: 0, // إلغاء الظل ليتطابق مع Flat Design
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // درجة انحناء الحواف
                  ),
                ),
                onPressed: () {
                  Prefs.setBool(kIsOnBoardingViewSeen, true);
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(SigninView.routeName);
                },
                child: const Text(
                  'ابدأ الان',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
// ابدأ الان