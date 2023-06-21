import 'dart:developer';
import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/site_wise_stock_model.dart';
import 'package:civil_manager/respository/stock_repository.dart';
import 'package:flutter/material.dart';

class StockViewModel with ChangeNotifier
{
  final _myRepo = StockRepository();

  TextEditingController  search = TextEditingController() ;


  ApiResponse<SiteWiseStockModel> stock = ApiResponse.loading();

  setLabourList(ApiResponse<SiteWiseStockModel> response){
    stock = response ;
    notifyListeners();
  }

  Future<void> fatchStockListApi(dynamic data)async{

    setLabourList(ApiResponse.loading());

    _myRepo.fetchStock(data).then((value){
      log(value.toJson().toString());

      setLabourList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setLabourList(ApiResponse.error(error.toString()));

    });
  }


}