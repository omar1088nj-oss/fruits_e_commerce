import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/widgets/custom_app_bar.dart';
import 'package:fruits_e_commerce/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const routeName = 'LoginView';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'تسجيل دخول'),
      body: const LoginViewBody(),
    );
  }
}
