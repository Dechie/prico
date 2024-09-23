import 'package:flutter/material.dart';
import 'package:pricecompare/services/product_add_service.dart';
import 'dart:io';

class AddProductViewModel extends ChangeNotifier {
  final AddProductService _addProductService = AddProductService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> addProduct({
    required String title,
    required String description,
    required String price,
    required bool flexiblePricing,
    required String categoryId,
    required String remainingStock,
    required List<File> images,
  }) async {
    setLoading(true);

    try {
      await _addProductService.addProduct(
        title: title,
        description: description,
        price: price,
        flexiblePricing: flexiblePricing,
        categoryId: categoryId,
        remainingStock: remainingStock,
        images: images,
      );
    } catch (e) {
      print("Error adding product: $e");
    }

    setLoading(false);
  }
}
