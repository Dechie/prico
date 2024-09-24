import 'package:flutter/material.dart';
import 'package:pricecompare/services/product_search_service.dart';

class ProductSearchViewModel extends ChangeNotifier {
  final ProductSearchService _productSearchService = ProductSearchService();
  List<dynamic> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<dynamic> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> searchForProducts(String query) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      List<dynamic> fetchedProducts =
          await _productSearchService.searchProducts(query);
      _products = fetchedProducts;
    } catch (error) {
      _errorMessage = 'Failed to search products: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
