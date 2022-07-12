import 'package:intl/intl.dart';

import 'common_utils.dart';

class FormatUtils {

  static Map<String, String> convertInternalLinkedHashMapToMap(dynamic input) {
    if (input == null) {
      return {};
    }
    Map map = input as Map;
    Map<String, String> indexedData = {};
    map.forEach((key, value) {
      indexedData[key] = '$value';
    });
    return indexedData;
  }

  static String formatCurrencyDoubleToString(double? currency,
      {bool haveUnit = true, bool aboutZero = false}) {
    try {
      if (currency == 0 && aboutZero) {
        return haveUnit ? '0 ₫' : '0';
      }
      if (CommonUtil.isNull(currency)) return '';
      final output = NumberFormat.simpleCurrency(locale: 'vi').format(currency);
      return haveUnit ? output : output.trim().replaceAll('₫', '');
    } catch (e) {
      return '$currency';
    }
  }

}