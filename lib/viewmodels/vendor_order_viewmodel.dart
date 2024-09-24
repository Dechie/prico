import 'package:flutter/material.dart';
import 'package:pricecompare/services/vendor_order_service.dart';

class VendorOrdersViewModel extends ChangeNotifier {
  final VendorOrderService vendororderService;
  List<Product> products = [];
  bool isLoading = true;
  String? errorMessage;

  VendorOrdersViewModel(this.vendororderService);

  Future<void> fetchOrders() async {
    try {
      isLoading = true;
      notifyListeners();
      products = await vendororderService.fetchUserOrders();
    } catch (error) {
      errorMessage = error.toString();
      print('Error fetching orders: $error'); 
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
