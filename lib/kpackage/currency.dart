import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Currency {
  static FlutterMoneyFormatter fmf;

  static convertToCurrency(double amount) {
    fmf = FlutterMoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
          symbol: 'LKR',
          thousandSeparator: ',',
          decimalSeparator: '.',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 2,
          compactFormatType: CompactFormatType.short),
    );
    return fmf.output.symbolOnLeft;
  }
}
