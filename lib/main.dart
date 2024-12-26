import 'package:flutter/material.dart';
import 'package:pricecompare/services/user_order_service.dart';
import 'package:pricecompare/services/vendor_order_service.dart';
import 'package:pricecompare/viewmodels/cart_viewmodel.dart';
import 'package:pricecompare/viewmodels/details_viewmodel.dart';
import 'package:pricecompare/viewmodels/user_order_viewmodel.dart';
import 'package:pricecompare/viewmodels/product_search_viewmodel.dart';
import 'package:pricecompare/viewmodels/vendor_order_viewmodel.dart';
import 'package:pricecompare/viewmodels/vendor_products_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'router.dart';
import 'viewmodels/signup_viewmodel.dart';
import 'viewmodels/login_viewmodel.dart';
import 'viewmodels/logout_viewmodel.dart';
import 'viewmodels/vendor_register_viewmodel.dart';
import 'viewmodels/product_viewmodel.dart';
import 'package:pricecompare/services/product_service.dart';
import 'package:pricecompare/services/network_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final connectivityResult = await Connectivity().checkConnectivity();
  final hasInternet = connectivityResult != ConnectivityResult.none;

  String ipAddress = await getLocalIpAddress();
  String baseUrl = 'http://$ipAddress:8000/api';

  runApp(PriceCompareApp(initialRoute: hasInternet ? '/' : '/noInternet', baseUrl: baseUrl));
}

class PriceCompareApp extends StatelessWidget {
  final String initialRoute;
  final String baseUrl;

  const PriceCompareApp({Key? key, required this.initialRoute, required this.baseUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignupViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => LogoutViewModel()),
        ChangeNotifierProvider(create: (_) => VendorViewModel()),
        ChangeNotifierProvider(create: (_) => ProductViewModel(productService: ProductService(baseUrl: baseUrl))),
        ChangeNotifierProvider(create: (_) => VendorProductViewModel()),
        ChangeNotifierProvider(create: (_) => ProductSearchViewModel()), 
        ChangeNotifierProvider(create: (_) => DetailsViewModel()), 
        ChangeNotifierProvider(create: (context) => CartViewModel(),),
        ChangeNotifierProvider(create: (_) => UserOrdersViewModel(UserOrderService())),
        ChangeNotifierProvider(create: (_) => VendorOrdersViewModel(VendorOrderService()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}