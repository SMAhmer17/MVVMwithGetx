
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getxmvvm/data/app_exceptions.dart';
import 'package:getxmvvm/data/network/base_api_services.dart';
import 'package:getxmvvm/resources/components/internet_exception_widgets.dart';

import 'package:http/http.dart' as http;


class NetworkApiServices extends BaseApiServices{


          // get Api
  @override
  Future<dynamic> getApi(String url)async{


    // PRINT ONLY IN DEBUG MODE
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;  

    try{
    final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson  = returnResponse(response); 
    }
      // no internet
    on SocketException{
      // throw InternetExceptionWidget(onPress: (){});
      throw InternetException('');
    }
    on RequestTimeOut{
      throw RequestTimeOut('');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }


        // post Api
  
   @override
  Future<dynamic> postApi( var data ,  String url)async{
    
    // PRINT ONLY IN DEBUG MODE
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;  

    try{
    final response = await http.post(Uri.parse(url) ,
    // if data sending in raw form then we don't need to do json encode
    // if data sending in form form then we  need to do json encode
    
    // FOR DATA IN RAW FORM
    // body: jsonEncode(data)

    // FOR DATA IN FORM FORM
    body: data
    ).timeout(Duration(seconds: 10));
      responseJson  = returnResponse(response); 
    }
      // no internet
    on SocketException{
      throw InternetException(' ');
    }on RequestTimeOut{
      throw RequestTimeOut(' ');
    }
        if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }





  dynamic returnResponse(http.Response response){
   
   switch(response.statusCode){
      case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;

      case 400:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
      default:
      throw FetchDataException( ' ' + response.statusCode.toString());
   } 
}
}
