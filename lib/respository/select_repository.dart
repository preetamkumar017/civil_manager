import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/site_list_rquest_model.dart';
import 'package:civil_manager/model/labour_head_model.dart';
import 'package:civil_manager/model/site_list_model.dart';
import 'package:civil_manager/model/stage_list_model.dart';
import 'package:civil_manager/res/app_url.dart';

class SelectRepository
{

  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<LabourHeadListModel> fetchHeadList()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.laborHeadListEndPoint);
      return response = LabourHeadListModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }

  Future<SiteListModel> fetchSiteList()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.siteListEndPoint);
      return response = SiteListModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }

  Future<SiteListRequestModel> fetchSiteListRequest()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.materialSiteListEndPoint);
      return response = SiteListRequestModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }

  Future<StageListModel> fetchStageList(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.stageListEndPoint,data);
      return response = StageListModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }
}