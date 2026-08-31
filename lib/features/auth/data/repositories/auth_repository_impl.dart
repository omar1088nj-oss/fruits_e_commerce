import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce/core/errors/exceptions.dart';
import 'package:fruits_e_commerce/core/errors/failures.dart';
import 'package:fruits_e_commerce/core/services/datebase_service.dart';
import 'package:fruits_e_commerce/core/services/firebase_auth_service.dart';
import 'package:fruits_e_commerce/features/auth/data/models/user_model.dart';
import 'package:fruits_e_commerce/features/auth/domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await _deleteUser(user);

      return left(ServerFailure(e.message));
    } catch (e) {
      await _deleteUser(user);
      log(
        'Exception in AuthRepoImp.createUserWithEmailAndPassword : ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.'));
    }
  }

  Future<void> _deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uId: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword : ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();

      var isUserExist = await databaseService.checkIfDataExists(
        path: 'users',
        documentId: user.uid,
      );
      UserEntity userEntity;

      if (isUserExist) {
        userEntity = await getUserData(uId: user.uid);
      } else {
        userEntity = UserModel.fromFirebaseUser(user);
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}');
      return left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: 'users', // اسم الـ Collection في Firestore
      documentId: user.uId, // استخدام uId الخاص بالـ Auth كـ Document ID
      data: user.toMap(), // تحويل الـ Entity إلى Map لتخزينها
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
      path: 'users',
      documentId: uId,
    );
    return UserModel.fromJson(userData);
  }
}
