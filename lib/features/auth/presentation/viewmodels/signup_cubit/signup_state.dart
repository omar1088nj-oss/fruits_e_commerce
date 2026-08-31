part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

/// الحالة الافتراضية للشاشة
final class SignupInitial extends SignupState {}

/// حالة التحميل أثناء إرسال البيانات إلى Firebase
final class SignupLoading extends SignupState {}

/// حالة النجاح وتُرجع بيانات المستخدم
final class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
  @override
  String toString() => 'SignupSuccess(uId: ${userEntity.uId})';
}

/// حالة الفشل وتُرجع رسالة الخطأ
final class SignupFailure extends SignupState {
  final String message;

  SignupFailure({required this.message});
}
