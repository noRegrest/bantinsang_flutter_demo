import 'package:flutter/material.dart';
import 'package:learning_flutter/router/route_constant.dart';
import 'package:learning_flutter/screen/home.dart';
import 'package:learning_flutter/screen/login.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const HomePageWidget(),
      );
    case loginScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const HomePageWidget(),
      );
    default:
      return MaterialPageRoute(
        // Make a screen for undefined
        builder: (context) => const LoginPage(),
      );
  }
}
