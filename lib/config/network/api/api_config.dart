part of 'api.dart';

typedef AddInterceptors = List<Interceptor> Function(Dio dio);

/// Api configuration
/// Config for global definition of Dio and Http Client
class ApiConfig {
  const ApiConfig(
    this.baseUrl, {
    this.connectionTimeout = const Duration(seconds: 10),
    this.receiveTimeout = const Duration(seconds: 20),
    this.interceptors = const [],
    this.onInitialization,
    this.useIsolate = true,
    this.useConnectivity = true,
    this.debug = false,
    this.validateStatus,
    this.connectivityCheckInterval = const Duration(seconds: 5),
    this.sslPinningTrustedCertificates = const [],
  });

  /// Base URL for API
  final String baseUrl;

  /// Use connectivity package to check internet connection
  final bool useConnectivity;

  /// Connection timeout duration
  final Duration connectionTimeout;

  /// Receive response timeout duration for receiving data
  final Duration receiveTimeout;

  /// Flag if to use isolate for Dio requests
  final bool useIsolate;

  /// Debug mode
  final bool debug;

  /// Callback after all interceptors are added
  final AddInterceptors? onInitialization;

  /// Interceptors
  final Iterable<Interceptor> interceptors;

  /// Validate status
  final ValidateStatus? validateStatus;

  /// Connectivity check interval
  final Duration connectivityCheckInterval;

  /// SSL trusted certificates for better security
  final List<String> sslPinningTrustedCertificates;
}

extension ApiConfigExtension on ApiConfig {
  BaseOptions get baseOptions {
    final headers = <String, dynamic>{
      'Accept': 'application/json',
      'Accept-Encoding': 'gzip, deflate',
      'Content-Type': 'application/json',
    };

    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers,
      validateStatus: validateStatus,
    );
  }
}
