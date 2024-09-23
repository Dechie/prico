import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

class AddProductService {
  final String _baseUrl = 'http://192.168.1.6:8000/api/product/add'; // Your API endpoint

  Future<void> addProduct({
    required String title,
    required String description,
    required String price,
    required bool flexiblePricing,
    required String categoryId,
    required String remainingStock,
    required List<File> images,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('auth_token'); // Get auth token from Shared Preferences

    if (authToken == null) {
      throw Exception("Authorization token not found");
    }

    var request = http.MultipartRequest('POST', Uri.parse(_baseUrl));

    request.headers['Authorization'] = 'Bearer $authToken';
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['price'] = price;
    request.fields['flexible_pricing'] = flexiblePricing ? '1' : '0';
    request.fields['category_id'] = categoryId;
    request.fields['remaining_stock'] = remainingStock;

    // Attach the images to the request
    for (var image in images) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'images[]', stream, length,
        filename: basename(image.path),
      );
      request.files.add(multipartFile);
    }

    // Send the request
    var response = await request.send();

    if (response.statusCode == 201) {
      print("Product added successfully");
    } else {
      print("Failed to add product. Status code: ${response.statusCode}");
      throw Exception("Failed to add product");
    }
  }
}
