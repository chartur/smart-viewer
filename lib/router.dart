import 'package:flutter/material.dart';
import 'package:smart_child_viewer/screens/login.screen.dart';
import 'package:smart_child_viewer/screens/player.screen.dart';
import 'package:smart_child_viewer/screens/welcome.screen.dart';

class AppRouter {
  static const String welcomeScreenRoute = '/';
  static const String loginScreenRoute = '/login';
  static const String playerScreenRoute = '/player';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map args = settings.arguments;
    switch (settings.name) {
      case welcomeScreenRoute:
        return initPage(WelcomeScreen());
        break;
      case loginScreenRoute:
        return initPage(LoginScreen());
        break;
      case playerScreenRoute:
        return initPage(PlayerScreen());
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }

  static initPage(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => page,
      transitionDuration: Duration(seconds: 0),
    );
  }
}