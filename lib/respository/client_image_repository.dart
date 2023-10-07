import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/CctvDetailsModel.dart';
import 'package:civil_manager/model/image_calender_model.dart';
import 'package:civil_manager/model/manual_image_model.dart';
import 'package:civil_manager/model/result_model.dart';
import 'package:civil_manager/res/app_url.dart';

class ClientImageRepository
{
  final BaseApiServices _apiServices = NetworkApiService();

  Future<CctvDetailsModel> fetchCctvDetails(dynamic data)async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.cctvDetails,data);
      return response = CctvDetailsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResultModel> uploadImageApi(dynamic files,dynamic data)async {
    try {
      dynamic response = await _apiServices.getPostWithFormDataApiResponse(AppUrl.siteImagesEndPoint,files,data);
      return response = ResultModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  Future<ManualImageModel> getManualUploadedImages(dynamic data)async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.manualUploadedImage,data);
      return response = ManualImageModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<ImageCalenderModel> getManualUploadedImagesCalender(dynamic data)async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.calenderImagesEndPoint,data);
      return response = ImageCalenderModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}