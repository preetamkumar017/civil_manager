import 'dart:convert';
import 'dart:developer';
import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/thekedar_list_model.dart';
import 'package:civil_manager/model/thekedar_work_list_model.dart';
import 'package:civil_manager/respository/thekedar_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThekedarController extends GetxController
{


  final _myRepo = ThekedarRepository();

  Rx<TextEditingController> thekedarName = TextEditingController().obs;

  RxString siteId = "".obs;
  get getSiteId => siteId.value;
  set setSiteId(String value) => siteId.value = value;

  final rxRequestStatus = Status.LOADING.obs ;
  final workList  = ThekedarWorkListModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setWorkList(ThekedarWorkListModel value) => workList.value = value ;
  void setError(String value) => error.value = value ;

  RxList<String> imageList = <String>[].obs;

  getData() async {
    setRxRequestStatus(Status.LOADING);
    Map data = {
      'site_id':getSiteId,
    };
    _myRepo.thekedarWorkListApi(data).then((value) {
      log(value.toJson().toString());

      if(value.code==200)
      {
        setWorkList(value);
      }

      setRxRequestStatus(Status.COMPLETED);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      log(error.toString());
    });
  }



  final rxRequestStatus1 = Status.LOADING.obs ;
  final workList1  = ThekedarListModel().obs ;
  RxString error1 = ''.obs;

  void setRxRequestStatus1(Status value) => rxRequestStatus1.value = value ;
  void setWorkList1(ThekedarListModel value) => workList1.value = value ;
  void setError1(String value) => error1.value = value ;

  getThekedarList() async {
    setRxRequestStatus1(Status.LOADING);
    _myRepo.thekedarListApi().then((value) {
      log(value.toJson().toString());

      if(value.code==200)
      {
        setWorkList1(value);
      }

      setRxRequestStatus1(Status.COMPLETED);
    }).onError((error, stackTrace) {
      setRxRequestStatus1(Status.ERROR);
      log(error.toString());
    });
  }

approve(Map data)
{

  setRxRequestStatus(Status.LOADING);
  _myRepo.thekedarApproveApi(data).then((value) {
    log(value.toJson().toString());
    if(value.code==200)
    {
      getData();
    }

    setRxRequestStatus(Status.COMPLETED);
  }).onError((error, stackTrace) {
    setRxRequestStatus(Status.ERROR);
    log(error.toString());
  });
}

}