import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final String title;

  DetailsView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details of $title'),
      ),
    );
  }
}