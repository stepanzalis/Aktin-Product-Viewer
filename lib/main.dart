// coverage:ignore-file

import 'package:aktin_product_viewer/app.dart';
import 'package:aktin_product_viewer/bootstrap.dart';
import 'package:aktin_product_viewer/config/di/injection.dart';

Future<void> main() async {
  await bootstrap(injection, App.new);
}
