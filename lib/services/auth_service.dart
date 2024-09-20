import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthService {
  final String registerUrl = 'http://192.168.1.3:8000/api/auth/register';


  Future<Map<String, dynamic>> registerUser(User user) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
} 