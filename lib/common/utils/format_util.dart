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

}