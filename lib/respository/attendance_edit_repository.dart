import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/result_model.dart';
import 'package:civil_manager/res/app_url.dart';

class AttendanceEditRepository
{
  final BaseApiServices _apiServices = NetworkApiService() ;
  Future<ResultModel> labourAttendanceEditApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.labourEditAttendanceEndPoint, data);
      return response = ResultModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }
}