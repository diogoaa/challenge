import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static Future read(String key) async {
    final storage = FlutterSecureStorage();

    var value = await storage.read(key: key);

    return value != null ? json.decode(value) : null;
  }

  static Future save(String key, value) async {
    final storage = FlutterSecureStorage();

    storage.write(key: key, value: json.encode(value));
  }

  static Future remove(String key) async {
    final storage = FlutterSecureStorage();

    await storage.delete(key: key);
  }
}
