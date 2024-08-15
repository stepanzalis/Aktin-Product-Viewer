part of 'connectivity.dart';

typedef OnConnectivityChanged = void Function(NetworkResult result);

/// [NetworkConnectionTicker] class is a controller class that provides
/// both a stream named [onConnectivityChanged] and a future named [isConnected] for checking
/// the current state of the internet connection
class NetworkConnectionTicker {
  NetworkConnectionTicker({
    required this.config,
  }) : serverUrl = Uri.parse(config.baseUrl).host {
    _controller = StreamController<NetworkConnectionStatus>.broadcast(
      onListen: () {
        _timer ??= Timer.periodic(
          config.connectivityCheckInterval,
          (timer) {
            if (config.debug) {
              log('checking connection', time: DateTime.now());
            }

            _checkConnectionRequest();
          },
        );
      },
      onCancel: () {
        _timer?.cancel();
      },
    );

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((listData) {
      if (listData.isEmpty) {
        return;
      }
      final result = listData.first;
      _setCurrentState(NetworkConnectionStatus.fromResult(result.toNetworkResult));
    });
  }

  final ApiConfig config;
  final String serverUrl;

  /// [connectivityResult] is the current connection status.
  NetworkResult? connectivityResult;

  /// [_timer] is a timer that runs periodically for checking connection.
  Timer? _timer;

  /// [_controller] is the [StreamController] used for the stream.
  @protected
  late final StreamController<NetworkConnectionStatus> _controller;

  /// [onConnectivityChanged] is the getter for the [_controller]'s [onConnectivityChanged] instance.
  Stream<NetworkConnectionStatus> get onConnectivityChanged => _controller.stream;

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  /// [_previousState] holds the previous connection state.
  ///
  /// We only update the connection information to the user only if current state
  /// does not match the previous state.
  NetworkConnectionStatus? _previousState;

  /// [isConnected] is the future that returns a [NetworkConnectionStatus] object.
  Future<NetworkConnectionStatus> isConnected() async {
    await _checkConnectionRequest();
    return _previousState!;
  }

  /// [_setCurrentState] sets the new state.
  ///
  /// It sets [_previousState] only if [_previousState] is different from
  /// [newState] or if [_previousState] is null. Furthermore, it pushes to the
  /// stream as well if [_controller.hasListener] is true and [_controller.isClosed]
  /// is false and [_controller.isPaused] is false.
  @protected
  void _setCurrentState(NetworkConnectionStatus newState) {
    if (_previousState == null || newState.result != _previousState!.result) {
      _previousState = newState;
      if (_controller.hasListener && !_controller.isClosed && !_controller.isPaused) {
        _controller.add(newState);
        connectivityResult = newState.result;
        if (config.debug) {
          log('_setCurrentState: $newState');
        }
      }
    }
  }

  @protected
  Future<void> _checkConnectionRequest() async {
    try {
      final lookupResult = await InternetAddress.lookup(serverUrl);
      if (lookupResult.isNotEmpty && lookupResult[0].rawAddress.isNotEmpty) {
        _setCurrentState(
          NetworkConnectionStatus(
            lastChangeDt: DateTime.now(),
            result: connectivityResult ?? NetworkResult.none,
          ),
        );
      }
    } catch (error, stacktrace) {
      if (config.debug) {
        debugPrint(error.toString());
        debugPrint(stacktrace.toString());
      }
      _setCurrentState(
        NetworkConnectionStatus(
          lastChangeDt: DateTime.now(),
          result: connectivityResult ?? NetworkResult.none,
        ),
      );
    }
  }

  void close() {
    _connectivitySubscription?.cancel();
    _controller.close();
  }
}
