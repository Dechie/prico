import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pricecompare/services/login_service.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginService _authService = LoginService();
  String? _token;
  String _message = "";
  bool _isLoading = false;

  String get message => _message;
  bool get isLoading => _isLoading;
  String? get token => _token;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final response = await _authService.login(email, password);
    _isLoading = false;

    if (response != null) {
      _message = response.message;
      _token = response.token;
      print('Login successful. Token: $_token');
      await _saveToken(_token!);
    } else {
      _message = "Login failed.";
    }

    notifyListeners();
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}
