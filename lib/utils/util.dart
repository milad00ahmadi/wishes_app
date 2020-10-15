import 'package:intl/intl.dart';

currencyFormat(double amount) {
  return NumberFormat.currency(
      locale: 'en_US', decimalDigits: 0, symbol: '\$')
      .format(amount);
}
