import 'dart:io';

import 'package:aktin_product_viewer/feature/core/domain/exception/exception.dart';
import 'package:aktin_product_viewer/feature/core/domain/exception/exception.handler.dart';
import 'package:aktin_product_viewer/feature/core/domain/exception/failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExceptionHandler', () {
    test('handles DioException with connectionTimeout type', () {
      // arrange
      final exception = DioException(
        type: DioExceptionType.connectionTimeout,
        requestOptions: RequestOptions(path: ''),
      );

      // act
      final handler = ExceptionHandler.handle(exception);

      // assert
      expect(handler.failure, isA<ConnectionTimeoutFailure>());
    });

    test('handles DioException with badResponse type and 400 status', () {
      // arrange
      final exception = DioException(
        type: DioExceptionType.badResponse,
        response: Response(
          statusCode: HttpStatus.badRequest,
          data: {'message': 'Bad Request'},
          requestOptions: RequestOptions(path: ''),
        ),
        requestOptions: RequestOptions(path: ''),
      );

      // act
      final handler = ExceptionHandler.handle(exception);

      // assert
      expect(handler.failure, isA<BadRequestFailure>());
      expect((handler.failure as BadRequestFailure).message, 'Bad Request');
    });

    test('handles DioException with badResponse type and unknown status', () {
      // arrange
      final exception = DioException(
        type: DioExceptionType.badResponse,
        response: Response(
          statusCode: 999,
          data: {'message': 'Unknown Error'},
          requestOptions: RequestOptions(path: ''),
        ),
        requestOptions: RequestOptions(path: ''),
      );

      // act
      final handler = ExceptionHandler.handle(exception);

      // assert
      expect(handler.failure, isA<BadResponseFailure>());
      expect((handler.failure as BadResponseFailure).message, 'Unknown Error');
    });

    test('handles DioException with no internet error', () {
      // arrange
      final exception = DioException(
        type: DioExceptionType.unknown,
        error: NoInternetException(),
        requestOptions: RequestOptions(path: ''),
      );

      // act
      final handler = ExceptionHandler.handle(exception);

      // assert
      expect(handler.failure, isA<NoInternetFailure>());
    });

    test('handles general Exception', () {
      // arrange
      final exception = Exception('Generic exception');

      // act
      final handler = ExceptionHandler.handle(exception);

      // assert
      expect(handler.failure, isA<UnknownFailure>());
      expect((handler.failure as UnknownFailure).message, 'Exception: Generic exception');
    });

    test('handles DioException with custom error message', () {
      // arrange
      final exception = DioException(
        type: DioExceptionType.unknown,
        message: 'Custom error message',
        requestOptions: RequestOptions(path: ''),
      );

      // act
      final handler = ExceptionHandler.handle(exception);

      // assert
      expect(handler.failure, isA<UnknownFailure>());
      expect((handler.failure as UnknownFailure).message, 'Custom error message');
    });
  });
}
