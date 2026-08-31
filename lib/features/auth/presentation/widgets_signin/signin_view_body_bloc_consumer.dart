import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:fruits_e_commerce/core/widgets/custom_progress_hud.dart';
import 'package:fruits_e_commerce/features/auth/presentation/viewmodels/signin_cubit/signin_cubit.dart';
import 'package:fruits_e_commerce/features/auth/presentation/widgets_signin/signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          buildErrorBar(context, 'نوررر تمت المهمة بنجاح');
        }
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SigninLoading,
          child: SigninViewBody(),
        );
      },
    );
  }
}
