import 'package:flutter/material.dart';

class LogoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Logout')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/home'),
          child: Text('Go to Home'),
        ),
      ),
    );
  }
}
