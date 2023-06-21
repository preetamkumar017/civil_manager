

import 'dart:io';

import 'package:civil_manager/data/app_exceptions.dart';
import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/request_mat_list_model.dart';
import 'package:civil_manager/model/receiving_material_model.dart';
import 'package:civil_manager/model/requested_new_material_list_model.dart';
import 'package:civil_manager/model/result_model.dart';
import 'package:civil_manager/res/app_url.dart';

class MaterialRepository
{

  BaseApiServices apiServices = NetworkApiService() ;

  Future<RequestMatListModel> fetchRequestMatList(dynamic data) async{
    try{
      dynamic response = await apiServices.getPostApiResponse(AppUrl.requestMatListEndPoint,data);

       response = RequestMatListModel.fromJson(response);
      return response;
    }catch(e){
      rethrow ;
    }
  }

  Future<ResultModel> sendRequestMatList(dynamic data) async{
    try{
      dynamic response = await apiServices.getPostApiResponse(AppUrl.addRequestMatListEndPoint,data);
      return response = ResultModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }



  Future<ReceivingMaterialModel> fetchRequestedMatList(dynamic data) async{
    try{
      dynamic response = await apiServices.getPostApiResponse(AppUrl.materialRequestedListEndPoint,data);
      response = ReceivingMaterialModel.fromJson(response);
      return response;
    }catch(e){
      rethrow ;
    }
  }


  Future<RequestedNewMaterialModel> fetchRequestedNewMatList(dynamic data) async{
    try{
      dynamic response = await apiServices.getPostApiResponse(AppUrl.requestedMatListEndPoint,data);

      response = RequestedNewMaterialModel.fromJson(response);
      return response;
    }catch(e){
      rethrow ;
    }
  }

  Future<ResultModel> receivedMaterial( dynamic data , dynamic file ) async{
    try{
    dynamic response = await apiServices.getPostWithFormDataApiResponse(AppUrl.materialReceivedEndPoint,file, data);

    return response = ResultModel.fromJson(response);
    }on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

}