import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pricecompare/services/cart_service.dart';

class CartViewModel extends ChangeNotifier {
  String? responseMessage;

  Future<void> addToCart(String productId) async {
    try {
      String token = await SharedPreferences.getInstance().then((prefs) => prefs.getString('auth_token') ?? '');
      final response = await CartService().addProductToCart(productId, token);
      responseMessage = response['message']; 
      notifyListeners();
    } catch (error) {
      responseMessage = error.toString(); 
      notifyListeners(); 
    }
  }
}

