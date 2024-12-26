import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/new_user_model.dart';
import 'package:pricecompare/services/network_utils.dart';

class AuthService {
  Future<String> getRegisterUrl() async {
    String ipAddress = await getLocalIpAddress();
    return 'http://$ipAddress:8000/api/auth/register';
  }

  Future<Map<String, dynamic>> registerUser(User user) async {
    String registerUrl = await getRegisterUrl();
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}