import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VendorProductService {
  static const String baseUrl = 'http://192.168.1.6:8000/api';
  Future<List<Product>> fetchProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      if (token == null) {
        throw Exception('Authorization token not found.');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/vendor/products'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        List<Product> products = (jsonResponse as List).map((productData) {
          return Product.fromJson(productData);
        }).toList();

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
  Future<String?> deleteProduct(int productId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      if (token == null) {
        return 'Authorization token not found.';
      }

      final response = await http.delete(
        Uri.parse('$baseUrl/product/$productId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse['message'];
      } else {
        return 'Failed to delete product';
      }
    } catch (e) {
      return 'An error occurred: $e';
    }
  }
}

 class Product {
    final int productId;
    final String title;
    final String description;
    final String image;
    final String price;

    Product({
      required this.productId,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
    });

    factory Product.fromJson(Map<String, dynamic> json) {
      return Product(
        productId: json['product_id'],
        title: json['title'],
        description: json['description'],
        image: json['image_urls'][0],
        price: json['price'].toString(),
      );
    }
  }
