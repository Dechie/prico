import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pricecompare/services/vendor_register_service.dart';

class VendorViewModel extends ChangeNotifier {
  final VendorService _vendorService = VendorService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _message;
  String? get message => _message;

  Future<void> registerVendor(String licenseNumber, File licenseFile) async {
    _isLoading = true;
    notifyListeners();

    _message = await _vendorService.registerVendor(licenseNumber, licenseFile);

    _isLoading = false;
    notifyListeners();
  }
}
