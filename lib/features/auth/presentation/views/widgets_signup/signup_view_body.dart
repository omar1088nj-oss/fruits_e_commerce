import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce/features/auth/presentation/views/widgets_signup/have_an_account_widget.dart';
import 'package:fruits_e_commerce/features/auth/presentation/views/widgets_signup/terms_and_conditions_widget.dart';
import 'package:fruits_e_commerce/features/auth/presentation/widgets/password_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String userName, email, password;
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) => userName = value!,
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(onSaved: (value) => password = value!),
              const SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      // execute sign up logic / trigger Cubit
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('يجب الموافقة على الشروط والأحكام'),
                        ),
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const SizedBox(height: 26),
              const HaveAnAccountWidget(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
