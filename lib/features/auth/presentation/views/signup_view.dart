import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/widgets/custom_app_bar.dart';
import 'package:fruits_e_commerce/features/auth/presentation/views/widgets_signup/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'SignupView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'حساب جديد'),
      body: SignupViewBody(),
    );
  }
}
