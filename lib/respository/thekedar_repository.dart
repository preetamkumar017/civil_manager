import 'dart:developer';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/result_model.dart';
import 'package:civil_manager/model/thekedar_list_model.dart';
import 'package:civil_manager/model/thekedar_work_list_model.dart';
import 'package:civil_manager/res/app_url.dart';


class ThekedarRepository {

  final _apiService  = NetworkApiService() ;





  Future<ThekedarWorkListModel> thekedarWorkListApi(var data) async{
    try{
      dynamic response = await _apiService.getPostApiResponse(AppUrl.thekedarWorkList,data);
      return response = ThekedarWorkListModel.fromJson(response);
    }catch(e)
    {
      rethrow ;
    }
  }

  Future<ThekedarListModel> thekedarListApi()
  async {
    try{
      dynamic response = await _apiService.getGetApiResponse( AppUrl.thekedar_list);
      return response = ThekedarListModel.fromJson(response);
    }catch(e)
    {
      log(e.toString());
      rethrow ;
    }
  }

  Future<ResultModel> thekedarEditWorkApi(var data) async{
    try{
      dynamic response = await _apiService.getPostApiResponse( AppUrl.thekedar_edit_data,data);
      return response = ResultModel.fromJson(response);
    }catch(e)
    {
      log(e.toString());
      rethrow ;
    }
  }
  Future<ResultModel> thekedarApproveApi(var data) async{
    try{
      dynamic response = await _apiService.getPostApiResponse( AppUrl.thekedar_approve,data);
      return response = ResultModel.fromJson(response);
    }catch(e)
    {
      log(e.toString());
      rethrow ;
    }
  }

}