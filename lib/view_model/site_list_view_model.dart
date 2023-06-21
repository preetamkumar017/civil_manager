
import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/site_list_model.dart';
import 'package:civil_manager/respository/site_list_repository.dart';
import 'package:flutter/material.dart';

class SiteListViewModel with ChangeNotifier
{
  final _myRepo = SiteListRepository();
  String date = "";

  void  setDate(String date)
  {
    this.date = date;    
  }

  String getDate()
  {
    return date;
  }
  
  ApiResponse<SiteListModel> siteList = ApiResponse.loading();
  
  setSiteList(ApiResponse<SiteListModel> response){
    siteList = response ;
    notifyListeners();
  }

  


  
  Future<void> fatchSiteListApi ()async{

    setSiteList(ApiResponse.loading());

    _myRepo.fatchSiteList().then((value){

      setSiteList(ApiResponse.completed(value));
      // print(value);
      

    }).onError((error, stackTrace){

      setSiteList(ApiResponse.error(error.toString()));

    });
  }

}