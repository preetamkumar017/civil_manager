import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/dashboard_model.dart';
import 'package:civil_manager/res/app_url.dart';

class DashboardRepository {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<DashboardModel> fetchDashboard()async{

    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.labourDashboardEndPoint);
      return response = DashboardModel.fromJson(response);
    }catch(e){
      rethrow ;
    }

  }

}