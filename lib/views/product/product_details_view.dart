import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pricecompare/viewmodels/details_viewmodel.dart';
import 'package:pricecompare/viewmodels/cart_viewmodel.dart';

class DetailsView extends StatefulWidget {
  final String productId;
  DetailsView({required this.productId});

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailsViewModel>(context, listen: false)
          .fetchProductAndVendorDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF400090)),
        backgroundColor: Color(0xFFF5EAFB),
        title: Text('Product Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
        ),
      ),
      body: Consumer<DetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage != null) {
            return Center(child: Text('Error: ${viewModel.errorMessage}'));
          } else if (viewModel.title != null) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          viewModel.imageUrl!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Name: ${viewModel.title}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
                    ),
                    SizedBox(height: 8),
                    Text('Description: ${viewModel.description}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
                    ),
                    SizedBox(height: 8),
                    Text('Price: ${viewModel.price}ETB',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(height: 16),
                    if (viewModel.storeName != null &&
                        viewModel.phoneNumber != null) ...[
                      Text(
                        'Store: ${viewModel.storeName}',
                        textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
                      ),
                      SizedBox(height: 8),
                      Text('Phone: ${viewModel.phoneNumber}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xFF400090),
                    ),
                      ),
                    ],
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          await Provider.of<CartViewModel>(context,
                                  listen: false)
                              .addToCart(widget.productId);
                          final cartViewModel = Provider.of<CartViewModel>(
                              context,
                              listen: false);
                          final message = cartViewModel.responseMessage ??
                              'Product addition failed';
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Color(0xFFF5EAFB),
                                content: Text(
                                  message,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: Color(0xFF6600B7)),
                                )),
                          );
                        },
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9D6DCD),
                          minimumSize: Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No product details available'));
          }
        },
      ),
    );
  }
}
