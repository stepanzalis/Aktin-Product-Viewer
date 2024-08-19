import 'dart:io';

import 'package:aktin_product_viewer/feature/core/domain/exception/failure.dart';
import 'package:dio/dio.dart';

import 'exception.dart';

/// Exception handler
///
/// This class is used to handle exceptions and return a [Failure] object.
/// The [handle] method receives an [Exception] and returns a [Failure] object.
final class ExceptionHandler {
  late Failure failure;

  ExceptionHandler.handle(Exception exception) {
    if (exception is DioException) {
      failure = _handleDioException(exception);
    } else {
      failure = _handleException(exception);
    }
  }

  Failure _handleDioException(DioException exception) {
    final _ = exception.response?.data;

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return ConnectionTimeoutFailure();
      case DioExceptionType.sendTimeout:
        return SendTimeoutFailure();
      case DioExceptionType.receiveTimeout:
        return ReceiveTimeoutFailure();
      case DioExceptionType.cancel:
        return CancelFailure();
      case DioExceptionType.badResponse:
        return _handleBadResponseException(exception);
      default:
        return _handleCustomDioException(exception);
    }
  }

  BadResponseFailure _handleBadResponseException(DioException exception) {
    final message = exception.response?.data['message'] ?? exception.message;
    final statusCode = exception.response?.data['code'] ?? exception.response?.statusCode;

    switch (statusCode) {
      case HttpStatus.badRequest:
        return BadRequestFailure(message);
      case HttpStatus.unauthorized:
        return UnauthorizedFailure(message);
      case HttpStatus.forbidden:
        return ForbiddenFailure(message);
      case HttpStatus.notFound:
        return NotFoundFailure(message);
      case HttpStatus.conflict:
        return ConflictFailure(message);
      case HttpStatus.internalServerError:
        return InternalServerErrorFailure(message);
      default:
        return BadResponseFailure(message);
    }
  }

  Failure _handleCustomDioException(DioException exception) {
    if (exception.error is NoInternetException) {
      return NoInternetFailure();
    }

    final message = exception.message ?? 'Unknown error: $exception.error';
    return UnknownFailure(message);
  }
}

Failure _handleException(Exception exception) {
  final message = exception.toString();
  return UnknownFailure(message);
}
