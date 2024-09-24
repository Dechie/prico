import 'dart:convert';
import 'package:pricecompare/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:pricecompare/models/product_model.dart';

class ProductService {
  final String baseUrl;

  ProductService({required this.baseUrl});

  Future<List<Product>> fetchProductsByCategory(String categorySlug) async {
    final response = await http.get(Uri.parse('$baseUrl/category/products/$categorySlug'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final category = jsonResponse['category'];
      final products = jsonResponse['products'] as List;

      return products.map((product) {
        return Product(
          productId: product['id'],
          title: product['title'],
          description: product['description'],
          price: product['price'].toDouble(),
          imageUrl: product['image_urls'][0],
          categoryName: category['name'],
        );
      }).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
