
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:getxmvvm/resources/Colors/app_colors.dart';

class InternetExceptionWidget extends StatefulWidget {
final VoidCallback onPress ;

  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
 
 
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
 
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20), 
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(height: height * .15  ,),
          Icon(Icons.cloud_off ,
          size: 50 ,
           color: AppColor.redColor,),
          Center(child: Padding(

            padding: const EdgeInsets.only(top : 30.0),
            child: Text('Internet_Exception'.tr,
            textAlign: TextAlign.center ,style: TextStyle(
              fontSize: 18 , 
              ),),
          ),),
          SizedBox(height: height * .15  ,),
          InkWell(
            onTap: widget.onPress ,
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Text('Retry' , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),)),
            ),
          )

        
        ],
      ),);
  }
}