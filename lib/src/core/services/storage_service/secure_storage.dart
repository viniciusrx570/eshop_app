import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ISecureStorageUtil implements SecureStorageUtil {
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> saveSecureData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> getSecureData(String key) async {
    return await _storage.read(key: key);
  }
}

abstract class SecureStorageUtil {
  Future<void> saveSecureData(String key, String value);
  Future<String?> getSecureData(String key);
}
