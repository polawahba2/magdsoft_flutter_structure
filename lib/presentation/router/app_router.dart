import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/view/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/view/registration_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => login_screen());
      case '/registration_screen':
        return MaterialPageRoute(builder: (_) => registration_screen());
      case '/user_profile':
        return MaterialPageRoute(builder: (_) => const user_profile());
      default:
        return null;
    }
  }
}
