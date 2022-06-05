import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/login_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const login_screen());
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return null;
    }
  }
}
