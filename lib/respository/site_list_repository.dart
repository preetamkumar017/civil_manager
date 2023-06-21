
import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/site_list_model.dart';
import 'package:civil_manager/res/app_url.dart';

class SiteListRepository
{
  
  BaseApiServices apiServices = NetworkApiService() ;

  Future<dynamic> fatchSiteList() async{
    
    try{

      dynamic response = await apiServices.getGetApiResponse(AppUrl.siteListEndPoint);
      // print(response);
      return response = SiteListModel.fromJson(response);
    }catch(e){
      rethrow ;
    }

  }
  
}