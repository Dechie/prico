import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final String productId;

  DetailsView({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productId.toString()),
      ),
      body: Center(
        child: Text('Details of $productId'),
      ),
    );
  }
}