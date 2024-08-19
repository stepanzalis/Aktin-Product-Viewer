import 'dart:io';

import 'package:intl/intl.dart';

extension PriceExtension on double {
  String formatCurrency() {
    var formatter = NumberFormat.currency(locale: Platform.localeName, symbol: "\$");
    return formatter.format(this);
  }
}
