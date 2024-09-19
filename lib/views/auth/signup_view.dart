import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool _obscureText = true;
  bool _obsecureTextConfirmedPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5EAFB),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
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
                Text('Sign up',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Color(0xFF6600B7))),
                SizedBox(height: 16),
                Container(
                  height: 40,
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
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
                  height: 40,
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Middle Name',
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
                  height: 40,
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
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
                  height: 40,
                  width: 250,
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
                  height: 40,
                  width: 250,
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
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                SizedBox(height: 16),
                Container(
                  height: 40,
                  width: 250,
                  child: TextField(
                    obscureText: _obsecureTextConfirmedPassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
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
                          _obsecureTextConfirmedPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xFF9D6DCD),
                        ),
                        onPressed: () {
                          setState(() {
                            _obsecureTextConfirmedPassword = !_obsecureTextConfirmedPassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9D6DCD),
                      minimumSize: Size(250, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 230,
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
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/'),
                    child: Text(
                      'Login',
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
                ),
              ],
            ),
          ),
        ));
  }
}
