import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailsService {
  final String baseUrl = 'http://192.168.1.6:8000/api';

  Future<Map<String, dynamic>?> fetchProductDetails(String productId) async {
    final response = await http.get(Uri.parse('$baseUrl/product/$productId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      print('Product cannot be found');
      return null;
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<Map<String, dynamic>?> fetchVendorDetails(String vendorId) async {
    final response = await http.get(Uri.parse('$baseUrl/vendor/$vendorId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      print('Vendor cannot be found');
      return null;
    } else {
      throw Exception('Failed to load vendor');
    }
  }
}
