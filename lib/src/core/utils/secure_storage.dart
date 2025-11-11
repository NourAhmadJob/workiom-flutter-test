import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = const FlutterSecureStorage();
  static const String _keyAccess = 'access_token';


  static Future<void> saveToken({
    required String access,
  }) async {
    await _storage.write(key: _keyAccess, value: access);
  }

  static Future<String> getAccessToken() async {
    return await _storage.read(key: _keyAccess) ?? 'null';
  }
  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

}
