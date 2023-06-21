import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/site_wise_stock_model.dart';
import 'package:civil_manager/res/app_url.dart';

class StockRepository {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<SiteWiseStockModel> fetchStock(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.siteWiseStockEndPoint,data);
      return response = SiteWiseStockModel.fromJson(response);
    }catch(e){
      rethrow ;
    }

  }

}