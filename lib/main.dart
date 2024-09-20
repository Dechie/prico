import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'router.dart';
import 'viewmodels/signup_viewmodel.dart';
import 'viewmodels/login_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final connectivityResult = await Connectivity().checkConnectivity();
  final hasInternet = connectivityResult != ConnectivityResult.none;

  runApp(PriceCompareApp(initialRoute: hasInternet ? '/' : '/noInternet'));
}

class PriceCompareApp extends StatelessWidget {
  final String initialRoute;
  const PriceCompareApp({Key? key, required this.initialRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignupViewModel()),
        //ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: MaterialApp(
        initialRoute: initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
