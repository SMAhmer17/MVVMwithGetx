
import 'dart:async';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getxmvvm/resources/routes/routes_names.dart';
import 'package:getxmvvm/view_model/controller/user_preferences/user_preference_VM.dart';

class SplashServices{

  UserPreferences userPreferences = UserPreferences();

    void isLogin(){

      userPreferences.getUser().then((value) {
        
        print( 'Token :  ${value.token}');
        print('Login : ${value.isLogin}');

        if(value.isLogin == false || value.isLogin.toString() == 'null' ){
               Timer(Duration(seconds: 3), () { 
        Get.toNamed(RouteName.LoginScreen);
      });
        }else{
          Timer(Duration(seconds: 3), () { 
        Get.toNamed(RouteName.HomeScreen);
      });
        }

      },);
      
    }


}