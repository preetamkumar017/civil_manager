
import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/labour_list_model.dart';
import 'package:civil_manager/model/result_model.dart';
import 'package:civil_manager/res/app_url.dart';

class LabourListRepository
{
  
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<dynamic> fatchLabourList() async{
    
    try{

      dynamic response = await _apiServices.getGetApiResponse(AppUrl.labourListEndPoint);
      // print(response);
      return response = LabourListModel.fromJson(response);
    }catch(e){
      rethrow ;
    }

  }
  
  Future<LabourListModel> fatchLabourListWithFilter(dynamic data) async{
    
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.labourListEndPoint,data);
      // print(response);
      return response = LabourListModel.fromJson(response);
    }catch(e){
      rethrow ;
    }

  }

  Future<ResultModel> labourDelete(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.labourDeleteEndPoint,data);
      return response = ResultModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}