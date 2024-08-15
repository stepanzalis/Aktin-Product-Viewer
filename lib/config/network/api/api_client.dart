part of 'api.dart';

class ApiClient {
  @visibleForTesting
  factory ApiClient.initializeTest(ApiConfig config, Dio dio) {
    dio.setup(config);
    return ApiClient._(
      config: config,
      dio: dio,
    );
  }

  /// Factory constructor to initialize the [ApiClient]
  factory ApiClient.initialize(
    ApiConfig config,
  ) {
    final dio = Dio(config.baseOptions)..setup(config);
    return ApiClient._(config: config, dio: dio);
  }

  /// Private constructor
  ApiClient._({
    required this.config,
    required this.dio,
  }) {
    connection = NetworkConnectionManager(config);
    isolate = YAJsonIsolate();
    if (config.useConnectivity) {
      connection.start();
    }
    if (config.useIsolate) {
      isolate.initialize();
    }
  }

  @visibleForTesting
  @protected
  final ApiConfig config;
  final Dio dio;

  ValueNotifier<NetworkConnectionStatus> get connectionState => connection.networkChangeListener;

  @protected
  late final YAJsonIsolate isolate;

  late NetworkConnectionManager connection;

  /// Close stream
  ///
  /// call on dispose application
  void close() {
    connection.close();
    isolate.dispose();
  }
}

/// Extension on Dio class to provide a setup method
extension DioNativeConfiguration on Dio {
  void setup(ApiConfig config) {
    this
      ..options = config.baseOptions
      .._useInterceptors(config);
  }

  /// Add interceptors to dio instance
  void _useInterceptors(ApiConfig config) {
    if (config.interceptors.isNotEmpty) {
      interceptors.addAll(config.interceptors);
    }
    if (config.onInitialization != null) {
      interceptors.addAll(config.onInitialization!.call(this));
    }
  }
}
