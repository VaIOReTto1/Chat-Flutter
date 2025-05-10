import 'package:chat_flutter/chat_flutter.dart';

import 'dart:convert';

class Utils {
  static List<T> toList<T>(String value, T Function(Map<String, dynamic> map) f) =>
      (formatJson(value) as List).map((e) => f(e)).toList();

  static T toObj<T>(String value, T Function(Map<String, dynamic> map) f) => f(formatJson(value));

  static List<dynamic> toListMap(String value) => formatJson(value);

  static dynamic formatJson(String value) => jsonDecode(value);

  static String checkOperationID(String? obj) => obj ?? DateTime.now().millisecondsSinceEpoch.toString();

  static Map<String, dynamic> cleanMap(Map<String, dynamic> map) {
    map.removeWhere((key, value) {
      if (value is Map<String, dynamic>) {
        cleanMap(value);
      }
      return value == null;
    });
    return map;
  }
}