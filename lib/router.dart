import 'package:flutter/material.dart';
import 'views/auth/login_view.dart';
import 'views/auth/signup_view.dart';
import 'views/auth/logout_view.dart';
import 'views/home/home_view.dart';
import 'views/home/orders_view.dart';
import 'views/profile/profile_view.dart';
import 'no_internet.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupView());
      case '/logout':
        return MaterialPageRoute(builder: (_) => LogoutView());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/orders':
        return MaterialPageRoute(builder: (_) => OrdersView());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileView());
      case '/noInternet':
        return MaterialPageRoute(builder: (_) => NoInternetPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
