import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pricecompare/services/network_utils.dart';

class CartService {
  Future<Map<String, dynamic>> addProductToCart(
      String productId, String token) async {
    String ipAddress = await getLocalIpAddress();
    final url = 'http://$ipAddress:8000/api/orders/add?product_id=$productId';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final responseBody = json.decode(response.body);

    if (response.statusCode == 201 &&
        responseBody['message'] == 'Product added successfully') {
      return responseBody;
    } else {
      throw Exception(
          'Failed to add product to cart: ${responseBody['message']}');
    }
  }
}
