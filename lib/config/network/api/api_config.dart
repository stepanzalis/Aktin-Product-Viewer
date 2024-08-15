part of 'api.dart';

typedef AddInterceptors = List<Interceptor> Function(Dio dio);

/// Api configuration
/// Config for global definition of Dio and Http Client
class ApiConfig {
  const ApiConfig(
    this.baseUrl, {
    this.connectionTimeout = const Duration(seconds: 5),
    this.receiveTimeout = const Duration(seconds: 15),
    this.interceptors = const [],
    this.onInitialization,
    this.useSelfSignedCertificate = false,
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

  /// Use self signed certificate
  // ! Don't use this in production
  final bool useSelfSignedCertificate;

  /// Connection timeout
  final Duration connectionTimeout;

  /// Receive timeout
  final Duration receiveTimeout;

  /// Use isolate for Dio
  final bool useIsolate;

  /// Debug mode
  final bool debug;

  /// Callback for adding interceptors
  final AddInterceptors? onInitialization;

  /// Interceptors
  final Iterable<Interceptor> interceptors;

  /// Validate status
  final ValidateStatus? validateStatus;

  /// Connectivity check interval
  final Duration connectivityCheckInterval;

  /// SSL pinning trusted certificates
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
