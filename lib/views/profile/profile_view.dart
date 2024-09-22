import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pricecompare/viewmodels/logout_viewmodel.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isBusinessAccount = false;

  @override
  void initState() {
    super.initState();
    _loadAccountType();
  }

  _loadAccountType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isBusinessAccount = prefs.getBool('isBusinessAccount') ?? false;
    });
  }

  _saveAccountType(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isBusinessAccount', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD9D9D9),
                ),
                child: HeroIcon(HeroIcons.user,
                    color: Colors.black, size: 50, style: HeroIconStyle.solid),
              ),
              Container(
                width: 150,
                child: Divider(
                  height: 0,
                  thickness: 1,
                  color: Color(0xFFC6C6C6),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Info',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Color(0xFF7C0090))),
                  Row(
                    children: [
                      Text('U',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Color(0xFF400090))),
                      Switch(
                        value: isBusinessAccount,
                        onChanged: (value) {
                          setState(() {
                            isBusinessAccount = value;
                            _saveAccountType(value);
                          });
                          if (value) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/vendorhome',
                              (Route<dynamic> route) => false,
                            );
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/userhome',
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                      ),
                      Text('B',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Color(0xFF400090))),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                width: 250,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    _showUpgradeToBusinessDialog(context);
                  },
                  child: Text(
                    'Upgrade to Business Account',
                    textAlign: TextAlign.center,
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
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red),
                ),
                width: 100,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    bool isLoggedOut = await Provider.of<LogoutViewModel>(
                            context,
                            listen: false)
                        .logout();

                    if (isLoggedOut) {
                      Navigator.pushReplacementNamed(context, '/');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color(0xFFF5EAFB),
                          duration: Duration(seconds: 1),
                            content: 
                            Text('Logout failed. Please try again.',
                            textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Color(0xFF6600B7)
                              ),
                            )
                            ),
                      );
                    }
                  },
                  child: Text(
                    'Logout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
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
      ),
    );
  }
  void _showUpgradeToBusinessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter TIN number',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Poppins',
              color: Color(0xFF29006C),
            ),
          ),
          content: TextField(
            decoration: InputDecoration(
                labelText: 'TIN Number',
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  color: Color(0xFF29006C),
                )),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xFF9B1DFF),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Upgrade',
                style: TextStyle(
                  color: Color(0xFF9B1DFF),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
