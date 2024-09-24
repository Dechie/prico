import 'package:flutter/material.dart';
import 'package:pricecompare/services/user_order_service.dart';

class UserOrdersViewModel extends ChangeNotifier {
  final UserOrderService userorderService;
  List<Product> products = [];
  bool isLoading = true;
  String? errorMessage;

  UserOrdersViewModel(this.userorderService);

  Future<void> fetchOrders() async {
    try {
      isLoading = true;
      notifyListeners();
      products = await userorderService.fetchUserOrders();
    } catch (error) {
      errorMessage = error.toString();
      print('Error fetching orders: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
