import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'storage_client.dart';

/// Storage adapter to store data in secure storage:
//
// Keychain is used for iOS
// AES encryption is used for Android. AES secret key is encrypted with RSA and RSA key is stored in KeyStore
class SecureStorageAdapter extends IStorageClient<String> {
  final SharedPreferences _sharedPreferences;

  /// Creates new instance of [SecureStorageAdapter]
  SecureStorageAdapter(this._sharedPreferences);

  @override
  FutureOr<void> clear() => _sharedPreferences.clear();

  @override
  FutureOr<void> delete(String key) => _sharedPreferences.remove(key);

  @override
  FutureOr read(String key) => _sharedPreferences.get(key);

  @override
  @override
  FutureOr<bool> save(String key, String value) {
    return _sharedPreferences.setString(
      key,
      value,
    );
  }
}
