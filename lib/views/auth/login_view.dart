import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Text('Welcome back!',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Color(0xFF6600B7))),
            SizedBox(height: 16),
            Container(
              height: 50,
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9D6DCD),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9D6DCD),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9D6DCD),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 50,
              width: 300,
              child: TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9D6DCD),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9D6DCD),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF9D6DCD),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Color(0xFF9D6DCD),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Color(0xFF9B1DFF),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                child: Text(
                  'Login',
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
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: Text(
                  'Create New Account',
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
      ),
    );
  }
}
