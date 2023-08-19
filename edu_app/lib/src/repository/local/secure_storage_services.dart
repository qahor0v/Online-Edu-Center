import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  String token;
  String password;
  String username;

  SecureStorage({
    required this.password,
    required this.username,
    required this.token,
  });

  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static const String _key = "user_token";
  static const String _password = "user_password";
  static const String _username = "user_login";

  static Future<void> saveToken(SecureStorage model) async {
    await storage.write(key: _key, value: model.token);
    await storage.write(key: _password, value: model.password);
    await storage.write(key: _username, value: model.username);
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: _key);
    await storage.delete(key: _password);
    await storage.delete(key: _username);
  }

  static Future<SecureStorage> getToken() async {
    final token = await storage.read(key: _key);
    final username = await storage.read(key: _username);
    final password = await storage.read(key: _password);
    return SecureStorage(
      password: password ?? "",
      username: username ?? "",
      token: token ?? "",
    );
  }
}
