import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/services/get_it_service.dart';
import 'package:fruits_e_commerce/core/widgets/custom_app_bar.dart';
import 'package:fruits_e_commerce/features/auth/presentation/viewmodels/signin_cubit/signin_cubit.dart';
import 'package:fruits_e_commerce/features/auth/presentation/widgets_signin/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  static const routeName = 'SigninView';

  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SigninCubit>(),
      child: Scaffold(
        appBar: buildAppBar(context, 'تسجيل دخول'),
        body: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
