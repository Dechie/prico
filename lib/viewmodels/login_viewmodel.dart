import 'package:flutter/material.dart';
import 'package:pricecompare/services/login_service.dart';
import 'package:pricecompare/models/login_response_model.dart';

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
    } else {
      _message = "Login failed.";
    }

    notifyListeners();
  }
}
