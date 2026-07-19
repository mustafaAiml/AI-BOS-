import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  static const String _tokenKey = 'auth_token';
  static const String _userSetupKey = 'user_setup_complete';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<void> setSetupComplete(bool complete) async {
    await _storage.write(key: _userSetupKey, value: complete.toString());
  }

  Future<bool> isSetupComplete() async {
    final val = await _storage.read(key: _userSetupKey);
    return val == 'true';
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
