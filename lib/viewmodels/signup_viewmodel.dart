import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/signup_service.dart';
import '../models/new_user_model.dart';

class SignupViewModel extends ChangeNotifier {
  AuthService _authService = AuthService();
  String? errorMessage;
  String? successMessage;
  String? token;

  Future<void> registerUser(
      String firstName, String middleName, String lastName, String email, String password, String passwordConfirmation) async {
    User user = User(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    final response = await _authService.registerUser(user);

    if (response.containsKey('errors')) {
      errorMessage = response['message'].toString();
      successMessage = null;
      token = null; 
    } else {
      successMessage = response['message'].toString();
      errorMessage = null;
      token = response['token'];
      await _saveToken(token!);
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