import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/labour_list_model.dart';
import 'package:civil_manager/respository/labour_list_repository.dart';
import 'package:flutter/foundation.dart';
class LabourListViewModel with ChangeNotifier
{
  final _myRepo = LabourListRepository();
  
  ApiResponse<LabourListModel> labourList = ApiResponse.loading();
  
  setLabourList(ApiResponse<LabourListModel> response){
    labourList = response ;
    notifyListeners();
  }

  

  Future<void> fatchLabourListApi ()async{

    setLabourList(ApiResponse.loading());

    _myRepo.fatchLabourList().then((value){
      
      setLabourList(ApiResponse.completed(value));    

    }).onError((error, stackTrace){

      setLabourList(ApiResponse.error(error.toString()));

    });
  }

  
  Future<void> fatchLabourListWithDataApi (dynamic data)async{

    setLabourList(ApiResponse.loading());

    _myRepo.fatchLabourListWithFilter(data).then((value){

      setLabourList(ApiResponse.completed(value));
      // print(value);
      

    }).onError((error, stackTrace){

      setLabourList(ApiResponse.error(error.toString()));

    });
  }

}