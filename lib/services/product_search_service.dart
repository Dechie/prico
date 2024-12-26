import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pricecompare/services/network_utils.dart';

class ProductSearchService {
  Future<String> getBaseUrl() async {
    String ipAddress = await getLocalIpAddress();
    return 'http://$ipAddress:8000/api/product/search';
  }

  Future<List<dynamic>> searchProducts(String query) async {
    try {
      String baseUrl = await getBaseUrl();
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