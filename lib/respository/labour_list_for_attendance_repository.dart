

import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:civil_manager/data/network/network_api_service.dart';
import 'package:civil_manager/model/labour_list_after_attendance_model.dart';
import 'package:civil_manager/model/labour_list_for_attendance_model.dart';
import 'package:civil_manager/model/result_model.dart';
import 'package:civil_manager/res/app_url.dart';
import 'package:http/src/multipart_file.dart';

class LabourListForAttendanceRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<LabourListForAttendanceModel> labourListForAttendance(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.labourAttendanceEndPoint, data);
      return response = LabourListForAttendanceModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<LabourListAfterAttendanceModel> labourListAfterAttendance(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.labourAttendanceListEndPoint, data);
      return response = LabourListAfterAttendanceModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResultModel> labourDeleteAttendance(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.labourDeleteAttendanceEndPoint,data);
      return response = ResultModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }



  Future<ResultModel> labourAddAttendance(dynamic data,List<MultipartFile> files) async {
    try {
      // print(data);
      dynamic response = await _apiServices.getPostWithFormDataAndJSONApiResponse(AppUrl.labourAddAttendanceEndPoint,files, data);
          // print(response);
      return response = ResultModel.fromJson(response);
    } catch (e) {
      rethrow ;
      // print("error: "+e.toString()) ;
    }
  }
}
