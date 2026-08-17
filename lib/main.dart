import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper_functions/on_generate_route.dart';
import 'package:fruits_e_commerce/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitHup());
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
