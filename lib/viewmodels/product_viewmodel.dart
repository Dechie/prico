import 'package:flutter/material.dart';
import 'package:pricecompare/models/product_model.dart';
import 'package:pricecompare/services/product_service.dart';

class ProductViewModel with ChangeNotifier {
  final ProductService productService;
  Map<String, List<Product>> _categoryProducts = {};
  bool _isLoading = false;
  String _errorMessage = '';

  ProductViewModel({required this.productService});

  Map<String, List<Product>> get categoryProducts => _categoryProducts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchProductsForCategories(List<String> categorySlugs) async {
    _isLoading = true;
    notifyListeners();

    try {
      for (var slug in categorySlugs) {
        final products = await productService.fetchProductsByCategory(slug);
        _categoryProducts[slug] = products;
      }
      _errorMessage = '';
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
