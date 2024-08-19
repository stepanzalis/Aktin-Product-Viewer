import 'package:aktin_product_viewer/config/network/connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('ConnectivityInfoImpl', () {
    late Connectivity connectionChecker;

    setUp(() {
      connectionChecker = MockConnectivity();
    });

    test('should return true when the connection is not none', () async {
      // arrange
      final connectivity = ConnectivityInfoImpl(connectionChecker: connectionChecker);
      when(() => connectionChecker.checkConnectivity()).thenAnswer((_) async => [
            ConnectivityResult.mobile,
            ConnectivityResult.wifi,
            ConnectivityResult.bluetooth,
            ConnectivityResult.ethernet,
            ConnectivityResult.other,
            ConnectivityResult.vpn,
          ]);

      // act
      final result = await connectivity.isConnected;

      // assert
      expect(result, true);
    });

    test('should return false when the connection is none', () async {
      // arrange
      final connectivity = ConnectivityInfoImpl(connectionChecker: connectionChecker);
      when(() => connectionChecker.checkConnectivity()).thenAnswer((_) async => [ConnectivityResult.none]);

      // act
      final result = await connectivity.isConnected;

      // assert
      expect(result, false);
    });
  });
}
