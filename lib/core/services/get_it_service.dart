import 'package:fruits_e_commerce/core/services/datebase_service.dart';
import 'package:fruits_e_commerce/core/services/firebase_auth_service.dart';
import 'package:fruits_e_commerce/core/services/firestore_service.dart';
import 'package:fruits_e_commerce/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fruits_e_commerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruits_e_commerce/features/auth/presentation/viewmodels/signin_cubit/signin_cubit.dart';
import 'package:fruits_e_commerce/features/auth/presentation/viewmodels/signup_cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // 1. تسجيل الخدمات الأساسية (Services)
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());

  // 2. تسجيل الـ Repositories
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(), // إضافة البرامتر المفقود
    ),
  );

  // 3. تسجيل الـ Cubits (يُفضل registerFactory لإنشاء نسخة جديدة عند كل طلب)
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepo>()));
  getIt.registerFactory<SigninCubit>(() => SigninCubit(getIt<AuthRepo>()));
}
