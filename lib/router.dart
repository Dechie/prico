import 'package:flutter/material.dart';
import 'views/auth/login_view.dart';
import 'views/auth/signup_view.dart';
import 'views/home/home_view.dart';
import 'views/home/guest_home_view.dart';
import 'views/home/vendor_home_view.dart';
import 'views/auth/guest.dart';
import 'views/product/product_details_view.dart';
import 'no_internet.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => GuestView());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupView());
      case '/userhome':
        return MaterialPageRoute(
          builder: (_) => HomeView(),
          settings: RouteSettings(arguments: {'isReplacement': true}),
        );
      case '/vendorhome':
        return MaterialPageRoute(
          builder: (_) => VendorHomeView(),
          settings: RouteSettings(arguments: {'isReplacement': true}),
        );
      case '/guesthome':
        return MaterialPageRoute(builder: (_) => GuestHomeView());
      case '/details':
        if (settings.arguments is Map) {
          final args = settings.arguments as Map;
          return MaterialPageRoute(
            builder: (_) => DetailsView(title: args['title']),
          );
        }
        return _errorRoute();
      case '/noInternet':
        return MaterialPageRoute(builder: (_) => NoInternetPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for this path'),
        ),
      ),
    );
  }
}
