import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce/core/errors/failures.dart';
import 'package:fruits_e_commerce/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uId});
}
