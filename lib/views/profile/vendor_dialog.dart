import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pricecompare/viewmodels/vendor_register_viewmodel.dart';

class VendorRegisterDialog extends StatefulWidget {
  @override
  _VendorRegisterDialogState createState() => _VendorRegisterDialogState();
}

class _VendorRegisterDialogState extends State<VendorRegisterDialog> {
  final TextEditingController _licenseNumberController =
      TextEditingController();
  File? _licenseFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _licenseFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final vendorViewModel = Provider.of<VendorViewModel>(context);

    return AlertDialog(
      backgroundColor: Color(0xFFF5EAFB),
      title: Text('Register Business',
      textAlign: TextAlign.center,
            style: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
      ),
      content: vendorViewModel.isLoading
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: double.infinity,
                height: 100.0,
                color: Colors.white,
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _licenseNumberController,
                  decoration: InputDecoration(labelText: 'License Number',
            labelStyle: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _pickFile,
                  child: Text(_licenseFile == null
                      ? 'Pick License File'
                      : 'File Selected',
            style: TextStyle(
                    color: Color(0xFF9B1DFF),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                      ),
                ),
                SizedBox(height: 10),
                if (vendorViewModel.message != null) ...[
                  Text(
                    vendorViewModel.message!,
                    style: TextStyle(
                        color: vendorViewModel.message ==
                                'Vendor registered successfully'
                            ? Colors.green
                            : Colors.red),
                  ),
                  SizedBox(height: 10),
                ],
              ],
            ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel',
            style: TextStyle(
                    color: Color(0xFF6600B7),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (_licenseFile != null) {
              vendorViewModel.registerVendor(
                _licenseNumberController.text,
                _licenseFile!,
              );
            }
          },
          child: Text('Register',
            style: TextStyle(
                    color: Color(0xFF6600B7),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
          ),
        ),
      ],
    );
  }
}
