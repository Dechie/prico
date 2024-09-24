import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductSearchService {
  final String baseUrl = 'http://192.168.1.6:8000/api/product/search';

  Future<List<dynamic>> searchProducts(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?query=$query'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        int totalItems = decodedResponse[0];
        List<dynamic> products = decodedResponse[1];

        if (totalItems > 0) {
          return products;
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      throw Exception('Error fetching products: $error');
    }
  }
}
