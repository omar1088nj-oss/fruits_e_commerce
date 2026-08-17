import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'spalsh';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
