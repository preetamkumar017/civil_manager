import 'package:civil_manager/respository/attendance_edit_repository.dart';
import 'package:civil_manager/respository/labour_reg_repository.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AttendanceEditViewModel extends ChangeNotifier
{

  final _myRepo = AttendanceEditRepository();
  bool _loading = false ;
  bool get loading => _loading ;

  bool _status = false ;
  bool get status => _status ;




  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setStatus(bool value){
    _status= value;
    notifyListeners();
  }



  Future<void> labourAttendanceEdit(dynamic data , BuildContext context) async {
    setLoading(true);
    _myRepo.labourAttendanceEditApi(data).then((value){
      setLoading(false);
      if(value.code==200)
      {
        setStatus(true);
        Utils.flushBarSuccessMessage('Attendance Edit Successfully', context);
      }else
      {
        setStatus(false);
        Utils.flushBarErrorMessage('Attendance Not Edited Something Went Wrong', context);
      }

    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        // print(error.toString());
      }

    });
  }




}