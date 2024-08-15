// coverage:ignore-file

import 'dart:async';
import 'dart:developer';

import 'package:aktin_product_viewer/config/constants/constants.dart';
import 'package:aktin_product_viewer/config/di/injectable_feature.dart';
import 'package:aktin_product_viewer/config/feature.dart';
import 'package:aktin_product_viewer/feature/products/products_feature.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../feature/core/core.feature.dart';
import '../network/api/api.dart';

late final GetIt locator;

const features = <Feature>[
  CoreFeature(),
  ProductsFeature(),
];

Future<void> injection() async {
  locator = GetIt.instance;

  // Get all features
  final injectableFeatures = features.map((feature) => feature.getInjectable(locator));

  setUpApiConfig(kBaseUrl);

  await initialize(injectableFeatures);
}

/// Initialize all [GetIt] registration
Future<void> initialize(Iterable<InjectableFeature> features) async {
  try {
    for (final feature in features) {
      feature.register();
    }
    for (final feature in features) {
      feature.postRegister();
    }
  } catch (e, _) {
    log("Error initializing GetIt: $e");
  }
}

/// Setup a new API configuration
void setUpApiConfig(String baseUrl) {
  locator.registerSingleton<ApiConfig>(
    ApiConfig(
      baseUrl,
      debug: kDebugMode,
      connectionTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 30),
      useConnectivity: false,
      interceptors: [
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      ],
    ),
  );
}
