/// Base class for all app exceptions
class AppException implements Exception {}

/// Thrown when HTTP error occurred
class HttpException implements AppException {
  final String? title;
  final String? message;
  final int? statusCode;

  HttpException({
    this.title,
    this.message,
    this.statusCode,
  });
}

/// Thrown when no internet connection
class NoInternetException extends HttpException {
  NoInternetException() : super(title: "No internet connection");
}
