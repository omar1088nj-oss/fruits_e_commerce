import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:fruits_e_commerce/core/widgets/custom_progress_hud.dart';
import 'package:fruits_e_commerce/features/auth/presentation/viewmodels/signup_cubit/signup_cubit.dart';
import 'package:fruits_e_commerce/features/auth/presentation/widgets_signup/signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          //     Navigator.pop(context);
          buildErrorBar(context, 'نوررر تمت المهمة بنجاح');
        }
        if (state is SignupFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SignupLoading,
          child: SignupViewBody(),
        );
      },
    );
  }
}
