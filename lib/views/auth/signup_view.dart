import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pricecompare/viewmodels/signup_viewmodel.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _obsecureTextConfirmedPassword = true;

  @override
  Widget build(BuildContext context) {
    final signupViewModel = Provider.of<SignupViewModel>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: SingleChildScrollView(
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
                // First Name
                _buildTextField(_firstNameController, 'First Name'),
                SizedBox(height: 16),
                // Middle Name
                _buildTextField(_middleNameController, 'Middle Name'),
                SizedBox(height: 16),
                // Last Name
                _buildTextField(_lastNameController, 'Last Name'),
                SizedBox(height: 16),
                // Email
                _buildTextField(_emailController, 'Email'),
                SizedBox(height: 16),
                // Password
                _buildPasswordField(
                    _passwordController, 'Password', _obscureText, () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }),
                SizedBox(height: 16),
                // Confirm Password
                _buildPasswordField(_confirmPasswordController,
                    'Confirm Password', _obsecureTextConfirmedPassword, () {
                  setState(() {
                    _obsecureTextConfirmedPassword =
                        !_obsecureTextConfirmedPassword;
                  });
                }),
                SizedBox(height: 16),
                // Signup Button
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      await signupViewModel.registerUser(
                        _firstNameController.text,
                        _middleNameController.text,
                        _lastNameController.text,
                        _emailController.text,
                        _passwordController.text,
                        _confirmPasswordController.text,
                      );
                      print(signupViewModel.token);
                      final message = signupViewModel.errorMessage ?? signupViewModel.successMessage;
                      if (message != null) {
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
                                color: Color(0xFF6600B7)
                              ),
                              ),
                              duration: Duration(seconds: 1),
                            ),
                        );
                      }
                      if (signupViewModel.errorMessage == null) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/userhome',
                          (Route<dynamic> route) => false,
                        );
                      }
                    },
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
                _buildLoginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Container(
      height: 60,
      width: 250,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            fontFamily: 'Poppins',
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9D6DCD)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9D6DCD)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9D6DCD)),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String label,
      bool obscureText, VoidCallback toggle) {
    return Container(
      height: 60,
      width: 250,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            fontFamily: 'Poppins',
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9D6DCD)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9D6DCD)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF9D6DCD)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFF9D6DCD),
            ),
            onPressed: toggle,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF9B1DFF)),
      ),
      width: 250,
      height: 40,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/login'),
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
    );
  }
}