// coverage:ignore-file

import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/mixins/logging.dart';

class SharedPreferences_Effect with SharedMixin_Logging {
  SharedPreferences_Effect({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  Future<bool> clear() {
    log.fine('clear');
    return _sharedPreferences.clear();
  }

  bool containsKey(String key) {
    log.fine('containsKey\n$key');
    return _sharedPreferences.containsKey(key);
  }

  Object? get(String key) {
    log.fine('get\n$key');
    return _sharedPreferences.get(key);
  }

  bool? getBool(String key) {
    log.fine('getBool\n$key');
    return _sharedPreferences.getBool(key);
  }

  double? getDouble(String key) {
    log.fine('getDouble\n$key');
    return _sharedPreferences.getDouble(key);
  }

  int? getInt(String key) {
    log.fine('getInt\n$key');
    return _sharedPreferences.getInt(key);
  }

  Set<String> getKeys() {
    log.fine('getKeys');
    return _sharedPreferences.getKeys();
  }

  String? getString(String key) {
    log.fine('getString\n$key');
    return _sharedPreferences.getString(key);
  }

  List<String>? getStringList(String key) {
    log.fine('getStringList\n$key');
    return _sharedPreferences.getStringList(key);
  }

  Future<void> reload() async {
    log.fine('reload');
    await _sharedPreferences.reload();
  }

  Future<bool> remove(String key) {
    log.fine('remove\n$key');
    return _sharedPreferences.remove(key);
  }

  /// This is ignored because we are following the API of
  /// [SharedPreferences.setBool] which uses a positional boolean parameter.
  // ignore: avoid_positional_boolean_parameters
  Future<bool> setBool(String key, bool value) {
    log.fine('setBool\n$key\n$value');
    return _sharedPreferences.setBool(key, value);
  }

  Future<bool> setDouble(String key, double value) {
    log.fine('setDouble\n$key\n$value');
    return _sharedPreferences.setDouble(key, value);
  }

  Future<bool> setInt(String key, int value) {
    log.fine('setInt\n$key\n$value');
    return _sharedPreferences.setInt(key, value);
  }

  Future<bool> setString(String key, String value) {
    log.fine('setString\n$key\n$value');
    return _sharedPreferences.setString(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) {
    log.fine('setStringList\n$key\n$value');
    return _sharedPreferences.setStringList(key, value);
  }
}
