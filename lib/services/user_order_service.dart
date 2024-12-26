import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pricecompare/services/network_utils.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final String price;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });
}

class UserOrderService {
  Future<String> getBaseUrl() async {
    String ipAddress = await getLocalIpAddress();
    return 'http://$ipAddress:8000/api';
  }

  Future<List<Product>> fetchUserOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    String baseUrl = await getBaseUrl();
    final response = await http.get(
      Uri.parse('$baseUrl/user/orders'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> orders = jsonDecode(response.body);
      List<Product> productsDetails = [];

      for (var order in orders) {
        int productId = order['product_id'];
        var productDetail = await fetchProductDetails(baseUrl, productId);
        if (productDetail != null) {
          productsDetails.add(productDetail);
        }
      }

      return productsDetails;
    } else {
      throw Exception('Failed to load orders: ${response.reasonPhrase}');
    }
  }

  Future<Product?> fetchProductDetails(String baseUrl, int productId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/product/$productId'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Product(
        title: data['title'],
        description: data['description'],
        image: (data['image_urls'] != null && data['image_urls'].isNotEmpty)
            ? data['image_urls'][0]
            : '',
        price: data['price'].toString(),
      );
    } else {
      print('Failed to fetch product details: ${response.reasonPhrase}');
      return null;
    }
  }
}