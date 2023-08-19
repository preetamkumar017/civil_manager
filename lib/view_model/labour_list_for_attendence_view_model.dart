import 'dart:developer';

import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/labour_list_after_attendance_model.dart';
import 'package:civil_manager/model/labour_list_for_attendance_model.dart';
import 'package:civil_manager/model/result_model.dart';
import 'package:civil_manager/respository/labour_list_for_attendance_repository.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/src/multipart_file.dart' as img;
class LabourListForAttendanceViewModel with ChangeNotifier {
  final _myRepo = LabourListForAttendanceRepository();
  List present = <bool>[];
  List halfDay = <bool>[];
  List night = <bool>[];
  List delete = <bool>[];
  List note = <String>[];
  List id = <String>[];

  bool getPresent(int index) => present[index];
  bool getHalfDay(int index) => halfDay[index];
  bool getNigh(int index) => night[index];
  bool getDelete(int index) => delete[index];
  String getNote(int index) => note[index];

  List getAllPresent() => present;
  List getAllHalfDay() => halfDay;
  List getAllNigh() => night;
  List getAllNote() => note;
  List getAllDelete() => delete;
  List getAllId() => id;

  setDefaultPresent(String id1) {
    // log(id1);
    present.add(false);
    halfDay.add(false);
    night.add(false);
    note.add("");
    id.add(id1);
  }

  setIdDelete(String id1) {
    log(id1);
    delete.add(false);
    id.add(id1);
  }

  clearIdDelete() {
    delete = [];
    id = [];
  }

  setpresent(int index) {
    present[index] = !present[index];
    notifyListeners();
  }

  setDelete(int index) {
    delete[index] = !delete[index];
    notifyListeners();
  }

  setHalfDay(int index) {
    halfDay[index] = !halfDay[index];
    notifyListeners();
  }

  setNight(int index) {
    night[index] = !night[index];
    notifyListeners();
  }

  setNote(int index, String data) {
    note[index] = data;
    notifyListeners();
  }

  bool _loading = false ;
  bool get loading => _loading ;

  bool _addLoading = false;
  bool get addLoading  => _addLoading;

  setAddLoading(bool value)
  {
    _addLoading = value;
    notifyListeners();
  }

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  ApiResponse<LabourListForAttendanceModel> labourList = ApiResponse.loading();
  ApiResponse<ResultModel> result = ApiResponse.loading();

  setLabourList(ApiResponse<LabourListForAttendanceModel> response) {
    labourList = response;
    notifyListeners();
  }


  ApiResponse<LabourListAfterAttendanceModel> labourListAfterAttendance = ApiResponse.loading();

  setLabourListAfterAttendance(ApiResponse<LabourListAfterAttendanceModel> response) {
    labourListAfterAttendance = response;
    notifyListeners();
  }

  //
  // ApiResponse<ResultModel> labourdeleteAttendance = ApiResponse.loading();
  //
  // setLabourdeleteAttendance(ApiResponse<ResultModel> response) {
  //   labourdeleteAttendance = response;
  //   notifyListeners();
  // }

  setResult(ApiResponse<ResultModel> response) {
    result = response;
    notifyListeners();
  }

  Future<void> labourListForAttendanceApi(dynamic data, BuildContext context) async {
    setLoading(true);
    setLabourList(ApiResponse.loading());
    _myRepo.labourListForAttendance(data).then((value) {
      
    setLoading(false);
      setLabourList(ApiResponse.completed(value));
      // print(value);
    }).onError((error, stackTrace) {
    setLoading(false);
      setLabourList(ApiResponse.error(error.toString()));
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> labourAddAttendanceApi(dynamic data, List<img.MultipartFile> file, BuildContext context) async {
        
    setAddLoading(true);
    setResult(ApiResponse.loading());

    _myRepo.labourAddAttendance(data ,file).then((value) {

      setAddLoading(false);
      setResult(ApiResponse.completed(value));

      if(value.code==200)
      {
        // Utils.flushBarErrorMessage(value.status.toString(), context);
        log(value.message.toString());
        Get.back();
        Get.back();
      }else{
        Utils.flushBarErrorMessage(value.status.toString(), context);
        log(value.status.toString());

      }
    }).onError((error, stackTrace) {

      setAddLoading(false);
      setResult(ApiResponse.error(error.toString()));
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }


  Future<void> labourListAfterAttendanceApi(dynamic data, BuildContext context) async {
    setLoading(true);
    setLabourListAfterAttendance(ApiResponse.loading());
    _myRepo.labourListAfterAttendance(data).then((value) {
      setLoading(false);
      setLabourListAfterAttendance(ApiResponse.completed(value));
      // print(value.result!.length.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      setLabourListAfterAttendance(ApiResponse.error(error.toString()));
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> labourDeleteAttendanceApi(dynamic data,dynamic wdata, BuildContext context) async {
    // setLoading(true);
    // setLabourdeleteAttendance(ApiResponse.loading());
    _myRepo.labourDeleteAttendance(data).then((value) {
      // setLoading(false);
      // setLabourdeleteAttendance(ApiResponse.completed(value));
      // if(value.code==200)
      //   {
      //     // labourListAfterAttendanceApi(wdata,context);
      //   }

    }).onError((error, stackTrace) {
      // setLoading(false);
      // setLabourdeleteAttendance(ApiResponse.error(error.toString()));
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }




  bool loadingImage = false;
  bool get getLoadingImage => loadingImage;
  void setLoadingImage(bool value)
  {
    loadingImage = value;
    notifyListeners();
  }
}
