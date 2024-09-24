import 'package:flutter/material.dart';
import 'package:pricecompare/services/details_service.dart';

class DetailsViewModel extends ChangeNotifier {
  final DetailsService _productService = DetailsService();

  String? title;
  String? description;
  double? price;
  String? imageUrl;
  String? vendorId;

  String? storeName;
  String? phoneNumber;

  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchProductAndVendorDetails(String productId) async {
    try {
      isLoading = true;
      notifyListeners();

      final productData = await _productService.fetchProductDetails(productId);
      if (productData != null) {
        title = productData['title'];
        description = productData['description'];
        price = productData['price'].toDouble();
        imageUrl = productData['image_urls'][0];
        vendorId = productData['vendor_id'].toString();

        if (vendorId != null) {
          final vendorData =
              await _productService.fetchVendorDetails(vendorId!);
          if (vendorData != null) {
            storeName = vendorData['store_name'];
            phoneNumber = vendorData['phone_number'];
          }
        }
      }
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
