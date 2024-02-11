
import 'package:get/get.dart';
import 'package:getxmvvm/resources/routes/routes_names.dart';
import 'package:getxmvvm/view/home/home_view.dart';
import 'package:getxmvvm/view/login/login_screen.dart';
import 'package:getxmvvm/view/splash_screen/splash_screen.dart';

class AppRoute{

  static appRoutes() => [

    GetPage(name: RouteName.SplashScreen , page: () => SplashScreen() ,
    transitionDuration: Duration(milliseconds: 200),
     transition: Transition.fadeIn) ,

     GetPage(name: RouteName.LoginScreen , page: () => LoginScreen() ,
    transitionDuration: Duration(milliseconds: 200),
     transition: Transition.fadeIn) ,

     GetPage(name: RouteName.HomeScreen , page: () => HomeScreen() ,
    transitionDuration: Duration(milliseconds: 200),
     transition: Transition.fadeIn) ,
  ];
}