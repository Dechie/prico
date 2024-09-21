import 'package:flutter/material.dart';

class GuestView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon.png',
              height: 75,
            ),
            Text(
              'PRICO',
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Jersey10',
                color: Color(0xFF9B1DFF),
              ),
            ),
            Text('Welcome!',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Color(0xFF6600B7))),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9D6DCD),
                  minimumSize:
                      Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8),
                  ),
                ),
              ),
            ),
            Container(
              width: 280,
              child: Divider(
                height: 40,
                thickness: 1,
                color: Colors.black,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFF9B1DFF)),
              ),
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/guesthome'),
                child: Text(
                  'Continue as Guest',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xFF9B1DFF)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  minimumSize:
                      Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), 
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}