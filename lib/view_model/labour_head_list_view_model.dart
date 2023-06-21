import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/labour_head_model.dart';
import 'package:civil_manager/respository/labour_head_repository.dart';
import 'package:flutter/cupertino.dart';
class LabourHeadListViewModel with ChangeNotifier {

  final _myRepo = LabourHeadRepository();

  ApiResponse<LabourHeadListModel> labourHeadList = ApiResponse.loading();

  setMoviesList(ApiResponse<LabourHeadListModel> response){
    labourHeadList = response ;
    notifyListeners();
  }


  Future<void> fetchHeadListApi ()async{

    setMoviesList(ApiResponse.loading());

    _myRepo.fetchMoviesList().then((value){

      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setMoviesList(ApiResponse.error(error.toString()));

    });
  }


}