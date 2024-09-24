import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
  final String ordersUrl = 'http://192.168.1.6:8000/api/user/orders';
  final String productDetailsUrl = 'http://192.168.1.6:8000/api/product/';

  Future<List<Product>> fetchUserOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    final response = await http.get(
      Uri.parse(ordersUrl),
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
        var productDetail = await fetchProductDetails(productId);
        if (productDetail != null) {
          productsDetails.add(productDetail);
        }
      }

      return productsDetails;
    } else {
      throw Exception('Failed to load orders: ${response.reasonPhrase}');
    }
  }

  Future<Product?> fetchProductDetails(int productId) async {
    final response = await http.get(
      Uri.parse('$productDetailsUrl$productId'),
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
