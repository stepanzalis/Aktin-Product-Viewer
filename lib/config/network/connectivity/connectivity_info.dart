part of 'connectivity.dart';

/// [ConnectivityInfo] is a class that checks if the device is connected to the internet.
abstract class ConnectivityInfo {
  /// Checks if the device is connected to the internet.
  Future<bool> get isConnected;
}
