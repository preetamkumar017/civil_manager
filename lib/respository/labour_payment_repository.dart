import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/labour_payment_model.dart';
import 'package:civil_manager/res/app_url.dart';

class LabourPaymentRepository
{
  BaseApiServices apiServices = NetworkApiService() ;


  Future<LabourPaymentModel> fatchLabourPaymentList(dynamic data) async{
    try{
      dynamic response = await apiServices.getPostApiResponse(AppUrl.labourPaymentListEndPoint,data);
      // print(response);
      return response = LabourPaymentModel.fromJson(response);
    }catch(e){
      rethrow ;
    }

  }



}