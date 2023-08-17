import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static const String key = "user_token";

  static Future<void> saveToken(String token) async {
    await storage.write(key: key, value: token);
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: key);
  }

  static Future<String> getToken() async {
    final data = await storage.read(key: key);
    return data ?? "";
  }
}
