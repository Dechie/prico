import 'package:flutter/material.dart';
import 'views/auth/login_view.dart';
import 'views/auth/signup_view.dart';
import 'views/home/home_view.dart';
import 'views/auth/guest.dart';
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
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/noInternet':
        return MaterialPageRoute(builder: (_) => NoInternetPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                )
      );
    }
  }
}
