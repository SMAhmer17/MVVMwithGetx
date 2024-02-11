
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/resources/Colors/app_colors.dart';

class Utils{



  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode nextFocus){

    current.unfocus();
    Focus.of(context).requestFocus(nextFocus);
  }



  static toastMessageBottom(String Message){

    Fluttertoast.showToast(
      msg: Message ,
      textColor: AppColor.whiteColor,
      backgroundColor: AppColor.blackColor,
      gravity: ToastGravity.BOTTOM_RIGHT
      );
  }


    static toastMessageTop(String Message){

    Fluttertoast.showToast(
      msg: Message ,
      textColor: AppColor.whiteColor,
      backgroundColor: AppColor.blackColor,
      gravity: ToastGravity.TOP
      );
  }

  static snackBar(String title , String message){
    Get.snackbar(
      backgroundColor : Colors.amber,
      title, 
      message);
  }

}