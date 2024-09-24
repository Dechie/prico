import 'dart:convert';
import 'package:http/http.dart' as http;

class CartService {
  Future<Map<String, dynamic>> addProductToCart(String productId, String token) async {
    final url = 'http://192.168.1.6:8000/api/orders/add?product_id=$productId';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final responseBody = json.decode(response.body);

    if (response.statusCode == 201 && responseBody['message'] == 'Product added successfuly') {
      return responseBody; 
    } else {
      throw Exception('Failed to add product to cart: ${responseBody['message']}');
    }
  }
}
