import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/request_mat_list_model.dart';
import 'package:civil_manager/model/receiving_material_model.dart';
import 'package:civil_manager/model/requested_new_material_list_model.dart';
import 'package:civil_manager/respository/material_repository.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaterialViewModel extends ChangeNotifier {


  List<TextEditingController> ltc = [];
  List<String> id = [];
  List<String> qty = [];

  List getAllLtc() => ltc;
  List getAllId() => id;
  List getAllQty() => qty;

  String getId(int index) => id[index];


  setDefaultList(String id1) {
    ltc.add(TextEditingController());
    qty.add("");
    id.add(id1);
  }

  TextEditingController getLtc(int index) => ltc[index];
  String getLtcText(int index) => ltc[index].text;

  setQty(int index,String value) {
    qty[index] = value;
    notifyListeners();
  }

  setLtc(int index,String value) {
    ltc[index].text = value;
    notifyListeners();
  }

  setClean()
  {
    for(int i=0;i<ltc.length;i++)
      {
        ltc[i].text = "";
        qty[i]= "";
      }
    notifyListeners();
  }



  final _myRepo = MaterialRepository();

  bool loading = false;
  bool get getLoading => loading;
  void setLoading(bool value)
  {
    loading = value;
    notifyListeners();
  }

  ApiResponse<RequestMatListModel> requestViewList = ApiResponse.loading();

  setRequestViewList(ApiResponse<RequestMatListModel> response){
    requestViewList = response ;
    notifyListeners();
  }


  Future<void> requestViewApi(dynamic data , BuildContext context) async {
    setRequestViewList(ApiResponse.loading());
    _myRepo.fetchRequestMatList(data).then((value){
      setRequestViewList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setRequestViewList(ApiResponse.error(error.toString()));
    });
  }


  Future<void> requestSendApi(dynamic data , BuildContext context) async {
    setLoading(true);

    _myRepo.sendRequestMatList(data).then((value){
      setLoading(false);
      if(value.code==200)
        {
          Get.back();
        }else
          {
            Utils.flushBarErrorMessage("something Wends Wrong", context);
          }

    }).onError((error, stackTrace){
      setLoading(false);
      setRequestViewList(ApiResponse.error(error.toString()));

    });

  }


  ApiResponse<ReceivingMaterialModel> requestedViewList = ApiResponse.loading();

  setRequestedViewList(ApiResponse<ReceivingMaterialModel> response){
    requestedViewList = response ;
    notifyListeners();
  }



  ApiResponse<RequestedNewMaterialModel> requestedNewViewList = ApiResponse.loading();

  setRequestedNewViewList(ApiResponse<RequestedNewMaterialModel> response){
    requestedNewViewList = response ;
    notifyListeners();
  }


  Future<void> requestedViewListApi(dynamic data) async {
    setRequestedViewList(ApiResponse.loading());
    _myRepo.fetchRequestedMatList(data).then((value){
      setRequestedViewList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setRequestedViewList(ApiResponse.error(error.toString()));
    });
  }



  Future<void> requestedNewViewListApi(dynamic data) async {
    setRequestedNewViewList(ApiResponse.loading());
    _myRepo.fetchRequestedNewMatList(data).then((value){
      setRequestedNewViewList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setRequestedNewViewList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> receivedMaterialApi( dynamic data , dynamic file,BuildContext context) async {
    setLoading(true);
    _myRepo.receivedMaterial(data ,file).then((value) async {
      setLoading(false);
      if(value.code==200)
      {
        Get.back(result: true);
        Utils.flushBarSuccessMessage("Data Received Successfully", context);
      }else
        {
          Utils.flushBarErrorMessage("Something Went Wrong", context);
        }

    }).onError((error, stackTrace){
      setLoading(false);
    });
  }

}
