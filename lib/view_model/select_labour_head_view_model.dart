import 'dart:developer';

import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/site_list_rquest_model.dart';
import 'package:civil_manager/model/labour_head_model.dart';
import 'package:civil_manager/model/site_list_model.dart';
import 'package:civil_manager/model/stage_list_model.dart';
import 'package:civil_manager/respository/select_repository.dart';
import 'package:flutter/material.dart';

class SelectViewModel with ChangeNotifier
{
  final _myRepo = SelectRepository();


  ApiResponse<LabourHeadListModel> labourHeadList = ApiResponse.loading();

  setHeadList(ApiResponse<LabourHeadListModel> response){
    labourHeadList = response ;
    notifyListeners();
  }


  ApiResponse<SiteListModel> siteList = ApiResponse.loading();

  setSiteList(ApiResponse<SiteListModel> response){
    siteList = response ;
    notifyListeners();
  }


  ApiResponse<SiteListRequestModel> siteRequestList = ApiResponse.loading();

  setSiteRequestList(ApiResponse<SiteListRequestModel> response){
    siteRequestList = response ;
    notifyListeners();
  }



  Future<void> fetchHeadListApi ()async{

    setHeadList(ApiResponse.loading());

    _myRepo.fetchHeadList().then((value){

      setHeadList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setHeadList(ApiResponse.error(error.toString()));

    });
  }

  Future<void> fetchSiteListApi ()async{

    setSiteList(ApiResponse.loading());

    _myRepo.fetchSiteList().then((value){

      setSiteList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setSiteList(ApiResponse.error(error.toString()));

    });
  }

  Future<void> fetchSiteListRequestApi()async{

    setSiteRequestList(ApiResponse.loading());

    _myRepo.fetchSiteListRequest().then((value){

      log(value.siteList!.length.toString());

      setSiteRequestList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setSiteRequestList(ApiResponse.error(error.toString()));

    });
  }



  ApiResponse<StageListModel> stageList = ApiResponse.loading();

  setStageList(ApiResponse<StageListModel> response){
    stageList = response ;
    notifyListeners();
  }

  Future<void> fetchStageListApi (dynamic data)async{

    setStageList(ApiResponse.loading());

    _myRepo.fetchStageList(data).then((value){
      // print(value.toJson().toString());
      setStageList(ApiResponse.completed(value));
    }).onError((error, stackTrace){

      setStageList(ApiResponse.error(error.toString()));
    });
  }

}