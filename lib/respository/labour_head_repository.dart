
import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/labour_head_model.dart';
import 'package:civil_manager/res/app_url.dart';

class LabourHeadRepository {

  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<LabourHeadListModel> fetchMoviesList()async{

    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.laborHeadListEndPoint);
      return response = LabourHeadListModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }

}