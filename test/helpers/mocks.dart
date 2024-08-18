// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:aktin_product_viewer/config/di/injection.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

/// Mock helper for mocking locator (`GetIt`) resources.
///
/// ```dart
/// class MockMyAwesomeBloc extends Mock implements MyAwesomeBloc {}
/// group('Mock helper for mocking bloc/cubit implementation with `mockito`', () {
///   late MyAwesomeBloc mockMyAwesomeBloc;
///   setUpAll(() async {
///     // Inject
///     await injectionWidgetTest(MockGetIt());
///     // Mock
///     mockMyAwesomeBloc = MockAccountListBloc();
///   });
///
///   setUp(() {
///     mockInLocator<MyAwesomeBloc>(mockMyAwesomeBloc);
///   });
/// });
/// ```
// ignore: strict_raw_type
void mockInLocator<T extends Object>(T mock) {
  when(
    () => locator.get<T>(
      param1: any<dynamic>(named: 'param1'),
      param2: any<dynamic>(named: 'param2'),
    ),
  ).thenReturn(mock);
  when(
    () => locator.call<T>(
      param1: any<dynamic>(named: 'param1'),
      param2: any<dynamic>(named: 'param2'),
    ),
  ).thenReturn(mock);
}

/// Returns a [Response] object with a successful HTTP status code and the provided data.
///
/// The default status code is 200, but can be overridden by passing in a different value.
/// Throws an assertion error if the provided status code is not between 200 and 300.
///
/// Example usage:
/// ```dart
/// final response = mockSuccessResponse(data: 'Hello, world!', statusCode: 201);
/// ```
///
/// Throws [AssertionError] if the provided status code is not between 200 and 300.
Response<T> mockSuccessResponse<T>({required T data, int statusCode = 200}) {
  assert(
    statusCode >= 200 && statusCode < 300,
    'Success response should be between 200 and 300',
  );
  return Response<T>(
    requestOptions: RequestOptions(path: 'example.com/api'),
    statusCode: statusCode,
    data: data,
  );
}

/// This function is used to generate mock failure responses in a DioException object.
///
/// The [data] parameter is a generic parameter representing potential data to be included in the response.
/// The [statusCode] parameter is an integer representing the status code of the response, with a default value of 400.
/// The [type] parameter is a DioExceptionType representing the type of error encountered, with a default value of DioExceptionType.badResponse.
///
/// Returns a DioException object with the type of error dependent on the input parameter value.
DioException mockFailureResponse<T>({
  T? data,
  int statusCode = HttpStatus.badRequest,
  DioExceptionType type = DioExceptionType.badResponse,
}) {
  assert(statusCode >= 400 && statusCode < 600, '''
  Client response should be between 400 and 499
  Server response should be between 500 and 599
  ''');
  final requestOptions = RequestOptions(path: 'example.com/api');
  switch (type) {
    case DioExceptionType.connectionTimeout:
      return DioException.connectionTimeout(
        timeout: const Duration(seconds: 10),
        requestOptions: requestOptions,
      );
    case DioExceptionType.receiveTimeout:
      return DioException.receiveTimeout(
        timeout: const Duration(seconds: 10),
        requestOptions: requestOptions,
      );
    case DioExceptionType.sendTimeout:
      return DioException.sendTimeout(
        timeout: const Duration(seconds: 10),
        requestOptions: requestOptions,
      );
    case DioExceptionType.connectionError:
      return DioException.connectionError(
        requestOptions: requestOptions,
        reason: 'Connection Error',
      );
    case DioExceptionType.badResponse:
    // ignore: no_default_cases
    default:
      return DioException.badResponse(
        statusCode: statusCode,
        requestOptions: requestOptions,
        response: Response<T>(
          statusCode: statusCode,
          requestOptions: requestOptions,
          data: data,
          headers: Headers.fromMap({
            Headers.contentTypeHeader: ['application/problem+json'],
          }),
        ),
      );
  }
}
