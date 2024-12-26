import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pricecompare/services/network_utils.dart';

class LogoutService {
  Future<String> getLogoutUrl() async {
  String ipAddress = await getLocalIpAddress();
  return 'http://$ipAddress:8000/api/auth/logout';
}

  Future<String?> logout() async {
    String logoutUrl = await getLogoutUrl();
    print('Preparing to logout...');
  try {
    print('Preparing to retrieve token...');
    print('Before retrieving SharedPreferences...');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('SharedPreferences retrieved.');
    String? token = prefs.getString('auth_token');
    print('Token: $token');
    
    if (token == null) {
      return "No token found, user not logged in.";
    }
    
    print('Token: $token');

    print('Making API call to logout...');
    final response = await http.post(
      Uri.parse(logoutUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 204) {
      return "Logout successful";
    } else {
      final data = jsonDecode(response.body);
      return data['message'] ?? "Logout failed with status: ${response.statusCode}";
    }
  } catch (e) {
  print('Error retrieving token: $e');
  return "An error occurred retrieving the token: $e";
  }
}

  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}
