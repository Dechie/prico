import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VendorService {
  Future<String> registerVendor(String licenseNumber, File licenseFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    if (token == null) {
      return 'No token found';
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.6:8000/api/vendor/register/bylicense'),
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Accept'] = 'application/json';

    request.fields['license_number'] = licenseNumber;
    request.files.add(await http.MultipartFile.fromPath('license', licenseFile.path));

    try {
      var response = await request.send();
      var responseData = await http.Response.fromStream(response);
      if (response.statusCode == 201 && responseData.body.contains("Vendor registered successfully")) {
        return 'Vendor registered successfully';
      } else {
        return 'Failed to register vendor. Status Code: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
