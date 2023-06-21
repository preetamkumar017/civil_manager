
import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/receiving_history_model.dart';
import 'package:civil_manager/res/app_url.dart';

class ReceivingHistoryRepository {

  final BaseApiServices _apiServices = NetworkApiService();


  Future<ReceivingHistoryModel> receivingHistoryApi(dynamic data )async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.receivingHistoryEndPoint, data);
      return response = ReceivingHistoryModel.fromJson(response) ;

    }catch(e){
      rethrow ;
    }
  }




}