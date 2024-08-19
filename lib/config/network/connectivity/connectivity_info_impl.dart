part of 'connectivity.dart';

/// [ConnectivityInfoImpl] is an implementation of the [ConnectivityInfo] class.
class ConnectivityInfoImpl implements ConnectivityInfo {
  final Connectivity _connectionChecker;

  ConnectivityInfoImpl({required Connectivity connectionChecker}) : _connectionChecker = connectionChecker;

  @override
  Future<bool> get isConnected => _connectionChecker
      .checkConnectivity()
      .then((value) => value.any((element) => element != ConnectivityResult.none));
}
