import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/labour_payment_model.dart';
import 'package:civil_manager/respository/labour_payment_repository.dart';
import 'package:flutter/material.dart';

class LabourPaymentListViewModel with ChangeNotifier {
  final _myRepo = LabourPaymentRepository();
  ApiResponse<LabourPaymentModel> labourList = ApiResponse.loading();

  setLabourList(ApiResponse<LabourPaymentModel> response){
    labourList = response ;
    notifyListeners();
  }



  Future<void> fatchLabourListWithDataApi (dynamic data)async{
    setLabourList(ApiResponse.loading());
    _myRepo.fatchLabourPaymentList(data).then((value){
      setLabourList(ApiResponse.completed(value));
      // print(value);
    }).onError((error, stackTrace){
      setLabourList(ApiResponse.error(error.toString()));

    });
  }


}