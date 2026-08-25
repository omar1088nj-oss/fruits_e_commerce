import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/utils/app_colors.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';
import 'package:fruits_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruits_e_commerce/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce/features/auth/presentation/widgets/dont_have_an_account_widget.dart';
import 'package:fruits_e_commerce/features/auth/presentation/widgets/or_divider.dart';
import 'package:fruits_e_commerce/features/auth/presentation/widgets/password_field.dart';
import 'package:fruits_e_commerce/features/auth/presentation/widgets/social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) => _email = value!,
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(onSaved: (value) => _password = value!),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: AppTextStyles.semiBold13.copyWith(
                        color: AppColors.green1_600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'تسجيل دخول',
              ),
              const SizedBox(height: 33),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesAppleIcon,
                title: 'تسجيل بواسطة أبل',
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
