import 'package:flutter/material.dart';
import 'package:pricecompare/services/logout_service.dart';

class LogoutViewModel extends ChangeNotifier {
  final LogoutService _logoutService = LogoutService();

  bool _isLoading = false;
  String? _message;

  bool get isLoading => _isLoading;
  String? get message => _message;

  Future<bool> logout() async {
    print('Logout method called');
    print('LogoutViewModel logout method called');
    _isLoading = true;
    notifyListeners();

    _message = await _logoutService.logout();

    if (_message == "Logout succesful") {
      await _logoutService.clearToken();
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
