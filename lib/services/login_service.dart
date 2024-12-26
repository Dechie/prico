import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pricecompare/models/login_response_model.dart';
import 'package:pricecompare/services/network_utils.dart';

class LoginService {
  Future<String> getBaseUrl() async {
    String ipAddress = await getLocalIpAddress();
    return 'http://$ipAddress:8000/api/auth/login';
  }

  Future<LoginResponse?> login(String email, String password) async {
    try {
      String baseUrl = await getBaseUrl();
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 201) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      } else {
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}