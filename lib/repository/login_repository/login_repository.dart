

import 'package:getxmvvm/data/network/network_api_services.dart';
import 'package:getxmvvm/resources/app_url/app_url.dart';

class LoginRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(var data)async{
    dynamic response = await _apiServices.postApi(
      data, 
      Appurl.loginApi);
      return response;
  }
}