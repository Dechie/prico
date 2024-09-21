import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class MustAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroIcon(
              HeroIcons.archiveBoxXMark,
              color: Color(0xFF29006C),
              size: 100,
              style: HeroIconStyle.outline,
            ),
            SizedBox(height: 16),
            Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF9B1DFF)),
      ),
      width: 250,
      height: 40,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/login'),
        child: Text(
          'Login to Continue',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Color(0xFF9B1DFF),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          minimumSize: Size(250, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MustAuthPage(),
  ));
}