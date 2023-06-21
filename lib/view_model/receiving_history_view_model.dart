import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/receiving_history_model.dart';
import 'package:civil_manager/respository/receiving_history_repository.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:flutter/material.dart';

class ReceivingHistoryViewModel with ChangeNotifier
{



  final _myRepo = ReceivingHistoryRepository();

  ApiResponse<ReceivingHistoryModel> receivingHistoryList = ApiResponse.loading();

  setReceivingHistoryList(ApiResponse<ReceivingHistoryModel> response){
    receivingHistoryList = response ;
    notifyListeners();
  }



  Future<void> receivedMaterialApi(dynamic data,BuildContext context) async {
    setReceivingHistoryList(ApiResponse.loading());
    _myRepo.receivingHistoryApi(data).then((value) async {
      setReceivingHistoryList(ApiResponse.completed(value));

      if(value.code==200)
      {
        Utils.flushBarSuccessMessage("Data Received Successfully", context);
      }else
      {
        Utils.flushBarErrorMessage("Something Went Wrong", context);
      }

    }).onError((error, stackTrace){
      setReceivingHistoryList(ApiResponse.error(error.toString()));
    });
  }


}
