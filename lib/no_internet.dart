import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  Future<void> checkConnectivity(BuildContext context) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final hasInternet = connectivityResult[0] != ConnectivityResult.none;

    if (hasInternet) {
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EAFB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
              ],
            ),
          ),
          Spacer(),
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'No internet connection',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Jersey10',
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () => checkConnectivity(context),
                  child: Text(
                    'Try again',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Jersey10',
                      color: Color(0xFF9B1DFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
