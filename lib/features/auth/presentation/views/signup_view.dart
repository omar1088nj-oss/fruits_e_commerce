import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/services/get_it_service.dart';
import 'package:fruits_e_commerce/core/widgets/custom_app_bar.dart';
import 'package:fruits_e_commerce/features/auth/presentation/viewmodels/signup_cubit/signup_cubit.dart';
import 'package:fruits_e_commerce/features/auth/presentation/widgets_signup/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'SignupView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: Scaffold(
        appBar: buildAppBar(context, 'حساب جديد'),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
