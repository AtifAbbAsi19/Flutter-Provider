import 'package:cubit_block_mvi_flutter_sample/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../view/HomeScreen.dart';
import '../../view/LoginScreen.dart';
import '../../view/SplashScreen.dart';
import '../../view/sign_up_screen.dart';

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings) {

   // final arguments = settings.arguments;

    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  const Signup());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No route defined"),
                  ),
                ));
    }
  }
}
