import 'package:dio/dio.dart';

import '../../../../feature/core/domain/exception/exception.dart';
import '../../connectivity/connectivity.dart';

/// [NoInternetInterceptor] is an interceptor that checks if the device is connected to the internet.
class NoInternetInterceptor extends Interceptor {
  final ConnectivityInfo networkInfo;

  NoInternetInterceptor({required this.networkInfo});

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (await networkInfo.isConnected) {
      handler.next(options);
    } else {
      handler.reject(
        DioException(
          error: NoInternetException(),
          requestOptions: options,
        ),
      );
    }
  }
}
