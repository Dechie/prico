import 'package:flutter/material.dart';
import 'package:pricecompare/services/vendor_product_service.dart';

class VendorProductViewModel extends ChangeNotifier {
  final VendorProductService _productService = VendorProductService();

  List<Product> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _products = await _productService.fetchProducts();
    } catch (e) {
      _errorMessage = 'Failed to load products: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(int? productId) async {
    if (productId == null) return;

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      String? result = await _productService.deleteProduct(productId);
      if (result != null && result == "Product deleted successfully") {
        _products.removeWhere((product) => product.productId == productId);
      } else {
        _errorMessage = result ?? 'Failed to delete product';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
