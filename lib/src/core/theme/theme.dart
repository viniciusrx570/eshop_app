import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeProvider with ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  bool _isDark = false;

  bool get isDark => _isDark;

  Future<void> loadTheme() async {
    final value = await _storage.read(key: 'theme');
    if (value != null) {
      _isDark = value == 'dark';
      notifyListeners();
    }
  }

  Future<void> toggleTheme() async {
    _isDark = !_isDark;
    await _storage.write(key: 'theme', value: _isDark ? 'dark' : 'light');
    notifyListeners();
  }

  ThemeData get themeData => _isDark
      ? ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        )
      : ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, brightness: Brightness.light),
          useMaterial3: true,
        );
}
