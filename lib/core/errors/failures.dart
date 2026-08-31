abstract class Failure {
  final String message;
  const Failure(this.message);
}

// خطأ قادم من السيرفر (مثل Firebase أو REST API)
class ServerFailure extends Failure {
  ServerFailure(super.message);
}

// خطأ في الاتصال بالإنترنت
class NetworkFailure extends Failure {
  NetworkFailure([super.message = 'تحقق من اتصالك بالإنترنت']);
}
