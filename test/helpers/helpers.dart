import 'package:aktin_product_viewer/config/di/injection.dart';
import 'package:aktin_product_viewer/feature/products/application/bloc/products_list_bloc.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/local_sources/products_dao.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/remote_sources/products_api.dart';
import 'package:aktin_product_viewer/feature/products/infrastructure/repositories/products_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

part 'injection.dart';
part 'injection.mock.dart';
