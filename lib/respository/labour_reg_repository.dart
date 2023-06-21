
import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/result_model.dart';
import 'package:civil_manager/res/app_url.dart';

class LabourRegRepository
{
  
  final BaseApiServices _apiServices = NetworkApiService() ;

  
  Future<ResultModel> labourRegApi(dynamic data )async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.labourRegEndPoint, data);
      return response = ResultModel.fromJson(response) ;

    }catch(e){
      rethrow ;
    }
  }


}