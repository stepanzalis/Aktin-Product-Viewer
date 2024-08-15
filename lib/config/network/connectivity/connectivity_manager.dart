part of 'connectivity.dart';

/// Manager for network connection
///
/// This class is responsible for managing the network connection and providing the current state of the connection.
final class NetworkConnectionManager {
  NetworkConnectionManager(
    this.config,
  ) {
    connectivityTicker = NetworkConnectionTicker(config: config);
  }

  @visibleForTesting
  @protected
  final ApiConfig config;

  @protected
  late final NetworkConnectionTicker connectivityTicker;

  /// Start timer and listener
  void start() {
    connectivityTicker.onConnectivityChanged.listen((event) {
      if (config.debug) {
        log('ConnectionManager: connectivity changed: $event');
      }

      networkChangeListener.value = event;
    });
  }

  /// Start timer and listener
  ValueNotifier<NetworkConnectionStatus> networkChangeListener = ValueNotifier(NetworkConnectionStatus.empty());

  /// Close stream
  ///
  /// call on dispose application
  void close() {
    connectivityTicker.close();
  }
}
