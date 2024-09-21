import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pricecompare/models/login_response_model.dart';

class LoginService {
  final String baseUrl = "http://192.168.1.6:8000/api/auth/login";

  Future<LoginResponse?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 201) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      } else {
        // Handle error
        print("Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
