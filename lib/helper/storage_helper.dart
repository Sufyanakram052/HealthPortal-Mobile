import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import 'package:get_storage/get_storage.dart';

class StorageHelper {
  static const box = FlutterSecureStorage();

  static Future<void> saveVariable(String? key, dynamic value) async {
    if (key != null && value != null) {
      await box.write(key: key, value: value);
    }
  }

  static Future<dynamic> getVariable(String? key) async {
    if (key != null) {
      var result = await box.read(key: key);
      return result;
    }
  }

  static Future<void> saveModel(String? key, dynamic value) async {
    if (key != null && value != null) {
      await box.write(key: key, value: jsonEncode(value));
      // print("After Saved Model: ${await getModel(key)}");
    }
  }

  static Future<dynamic> getModel(String? key) async {
    if (key != null) {
      try {
        var data = await box.read(key: key);
        if (data != null) {
          return jsonDecode(data);
        } else {
          return null;
        }
      } catch (e) {
        return null;
      }
    }
  }

  static void clearData() async {
    await box.deleteAll();
  }

  static void clearSpecificStorage(String key) async {
    await box.delete(key: key);
  }
}
