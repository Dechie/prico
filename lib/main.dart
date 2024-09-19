import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'router.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final connectivityResult = await Connectivity().checkConnectivity();
  final hasInternet = connectivityResult[0] != ConnectivityResult.none;
  print('$connectivityResult');
  print('$hasInternet');
  runApp(PriceCompareApp(initialRoute: hasInternet ? '/' : '/noInternet'));
}

class PriceCompareApp extends StatelessWidget {
  final String initialRoute;
  const PriceCompareApp({Key? key, required this.initialRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
