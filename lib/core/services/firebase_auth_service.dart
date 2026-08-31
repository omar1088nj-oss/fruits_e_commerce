import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()}',
      );
      // بدلاً من print، نلقي CustomException بالرسالة المناسبة
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة السر ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الإلكتروني مستخدم بالفعل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تأكد من اتصالك بالانترنت ');
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ ما , الرجاء  المحاولة مرة اخرى ',
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()}',
      );
      throw CustomException(
        message: 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.',
      );
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()}',
      );
      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        throw CustomException(
          message: 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور غير صحيحة.');
      } else if (e.code == 'user-disabled') {
        throw CustomException(message: 'تم تمحيص أو حظر هذا الحساب.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تأكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ ما، الرجاء المحاولة مرة أخرى.',
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()}',
      );
      throw CustomException(
        message: 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.',
      );
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      // 1. فتح نافذة اختيار حساب Google للمستخدم
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // المستخدم أغلق النافذة دون اختيار حساب
        throw CustomException(message: 'تم إلغاء عملية تسجيل الدخول.');
      }

      // 2. الحصول على تفاصيل المصادقة (Tokens) من الحساب المختار
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 3. إنشاء الاعتماد الخاص بـ Firebase
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4. تسجيل الدخول في Firebase باستعمال الاعتماد
      return (await _firebaseAuth.signInWithCredential(credential)).user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService.signInWithGoogle: ${e.toString()}');
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
          message: 'الحساب موجود بالفعل باستخدام طريقة دخول أخرى.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تأكد من اتصالك بالإنترنت.');
      } else {
        throw CustomException(message: 'حدث خطأ أثناء التسجيل بواسطة Google.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithGoogle: ${e.toString()}');
      throw CustomException(
        message: 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.',
      );
    }
  }

  /// حذف حساب المستخدم الحالي من Firebase Auth
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
