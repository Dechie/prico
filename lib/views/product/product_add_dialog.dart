import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pricecompare/viewmodels/product_add_viewmodel.dart';
import 'package:pricecompare/models/category_model.dart';

class ProductAddDialog extends StatefulWidget {
  final AddProductViewModel viewModel;

  const ProductAddDialog({Key? key, required this.viewModel}) : super(key: key);

  @override
  _ProductAddDialogState createState() => _ProductAddDialogState();
}

class _ProductAddDialogState extends State<ProductAddDialog> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  bool flexiblePricing = false;
  int? selectedCategoryId;
  List<File> selectedImages = [];

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null && images.isNotEmpty) {
      setState(() {
        selectedImages = images.map((image) => File(image.path)).toList();
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && selectedCategoryId != null) {
      await widget.viewModel.addProduct(
        title: titleController.text,
        description: descriptionController.text,
        price: priceController.text,
        flexiblePricing: flexiblePricing,
        categoryId: selectedCategoryId.toString(),
        remainingStock: stockController.text,
        images: selectedImages,
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFF5EAFB),
      title: const Text(
        'Add Product',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF9B1DFF),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Remaining Stock',
                  labelStyle: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the remaining stock';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  const Text(
                    'Category:',
                    style: TextStyle(
                      color: Color(0xFF9B1DFF),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton<int>(
                      value: selectedCategoryId,
                      isExpanded: true,
                      items: categories.map((Category category) {
                        return DropdownMenuItem<int>(
                          value: category.id,
                          child: Text(
                            category.name,
                            style: TextStyle(
                              color: Color(0xFF9B1DFF),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedCategoryId = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SwitchListTile(
                title: const Text(
                  'Flexible Pricing',
                  style: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: flexiblePricing,
                onChanged: (bool value) {
                  setState(() {
                    flexiblePricing = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: _pickImages,
                child: const Text(
                  'Pick Images',
                  style: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              selectedImages.isNotEmpty
                  ? Wrap(
                      children: selectedImages
                          .map((image) =>
                              Image.file(image, width: 100, height: 100))
                          .toList(),
                    )
                  : const Text(
                      'No images selected',
                      style: TextStyle(
                        color: Color(0xFF9B1DFF),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Color(0xFF6600B7),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text(
            'Submit',
            style: TextStyle(
              color: Color(0xFF6600B7),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: _submitForm,
        ),
      ],
    );
  }
}
