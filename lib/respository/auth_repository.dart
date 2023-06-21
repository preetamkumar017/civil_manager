

import 'dart:developer';

import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/user_model.dart';
import 'package:civil_manager/res/app_url.dart';

class AuthRepository  {

  final BaseApiServices _apiServices = NetworkApiService() ;


  Future<UserModel> loginApi(dynamic data )async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPint, data);
      log(response.toString());
      return UserModel.fromJson(response) ;

    }catch(e){
      rethrow ;
    }
  }

  Future<dynamic> signUpApi(dynamic data )async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response ;


    }catch(e){
      rethrow ;
    }
  }

}