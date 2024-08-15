part of 'connectivity.dart';

@immutable
class NetworkConnectionStatus extends Equatable {
  const NetworkConnectionStatus({
    required this.lastChangeDt,
    this.result = NetworkResult.none,
  });

  /// Prepare new Connection status from Connectivity Result
  ///
  /// [ConnectivityResult] from [Connectivity]
  factory NetworkConnectionStatus.fromResult(NetworkResult result) => NetworkConnectionStatus(
        lastChangeDt: DateTime.now(),
        result: result,
      );

  /// Prepare default state on start app
  ///
  /// [isConnected]: true
  /// [lastChangeDt]: DateTime.now()
  /// [network]: 'unknown'
  factory NetworkConnectionStatus.empty() => NetworkConnectionStatus(lastChangeDt: DateTime.now());

  final NetworkResult result;
  final DateTime lastChangeDt;
  // coverage:ignore-start
  @override
  List<Object?> get props => [result, lastChangeDt];
  // coverage:ignore-end

  bool get isConnected => result != NetworkResult.none;
}

extension ConnectivityResultExtension on ConnectivityResult {
  NetworkResult get toNetworkResult {
    switch (this) {
      case ConnectivityResult.wifi:
        return NetworkResult.wifi;
      case ConnectivityResult.mobile:
        return NetworkResult.mobile;
      case ConnectivityResult.none:
        return NetworkResult.none;
      case ConnectivityResult.bluetooth:
        return NetworkResult.bluetooth;
      case ConnectivityResult.ethernet:
        return NetworkResult.ethernet;
      case ConnectivityResult.vpn:
        return NetworkResult.vpn;
      case ConnectivityResult.other:
        return NetworkResult.other;
    }
  }
}

/// Connection status check result.
enum NetworkResult {
  /// Bluetooth: Device connected via bluetooth
  bluetooth,

  /// WiFi: Device connected via Wi-Fi
  wifi,

  /// Ethernet: Device connected to ethernet network
  ethernet,

  /// Mobile: Device connected to cellular network
  mobile,

  /// None: Device not connected to any network
  none,

  /// VPN: Device connected to a VPN
  ///
  /// Note for iOS and macOS:
  /// There is no separate network interface type for [vpn].
  /// It returns [other] on any device (also simulator).
  vpn,

  /// Other: Device is connected to an unknown network
  other
}
