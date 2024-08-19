// coverage:ignore-file

import 'dart:async';
import 'dart:developer';

import 'package:aktin_product_viewer/config/constants/constants.dart';
import 'package:aktin_product_viewer/config/di/injectable_feature.dart';
import 'package:aktin_product_viewer/config/feature.dart';
import 'package:aktin_product_viewer/config/network/connectivity/connectivity.dart';
import 'package:aktin_product_viewer/feature/products/products_feature.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../feature/core/core.feature.dart';
import '../network/api/api.dart';
import '../network/api/interceptors/no_internet_interceptor.dart';

late final GetIt locator;

/// List of all features
const features = <Feature>[
  CoreFeature(),
  ProductsFeature(),
];

/// Initialize all dependencies
Future<void> injection() async {
  locator = GetIt.instance;

  // Get all features
  final injectableFeatures = features.map((feature) => feature.getInjectable(locator));

  setUpApiConfig();

  await initialize(injectableFeatures);
}

/// Initialize all [GetIt] registration
Future<void> initialize(Iterable<InjectableFeature> features) async {
  try {
    for (final feature in features) {
      feature
        ..preRegister()
        ..register()
        ..postRegister();
    }
  } catch (e, _) {
    log("Error initializing GetIt: $e");
  }
}

/// Setup a new API configuration
void setUpApiConfig() {
  locator.registerSingleton<ApiConfig>(
    ApiConfig(
      kBaseUrl,
      debug: kDebugMode,
      connectionTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      useConnectivity: false,
      interceptors: [
        NoInternetInterceptor(
          networkInfo: ConnectivityInfoImpl(connectionChecker: Connectivity()),
        ),
        if (kDebugMode)
          LogInterceptor(
            requestBody: true,
            responseBody: true,
            error: true,
          ),
      ],
    ),
  );
}
