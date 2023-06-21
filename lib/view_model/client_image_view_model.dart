import 'dart:developer';

import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/CctvDetailsModel.dart';
import 'package:civil_manager/respository/client_image_repository.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class ClientImageViewModel with  ChangeNotifier
{
  final _myRepo = ClientImageRepository();

  ApiResponse<CctvDetailsModel> cctvDetails = ApiResponse.loading();
  get getCctvDetails=> cctvDetails;
  setCctvDetails(ApiResponse<CctvDetailsModel> response){
    cctvDetails = response ;
    notifyListeners();
  }


  Future<void> fetchCctvDetails(dynamic data)async {
    setCctvDetails(ApiResponse.loading());
    _myRepo.fetchCctvDetails(data).then((value) {
      if(value.code == 200)
        {
          log(value.result!.toJson().toString());
          setCctvDetails(ApiResponse.completed(value));
        }else
          {
            Utils.toastMessage("Something Went Wrong");
          }
    }).onError((error, stackTrace) {
      setCctvDetails(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
      debugPrint(error.toString());
    });
  }



}