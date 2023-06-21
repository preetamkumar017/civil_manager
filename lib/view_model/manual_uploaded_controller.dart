import 'dart:developer';

import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/manual_image_model.dart';
import 'package:civil_manager/respository/client_image_repository.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ManualUploadedController extends GetxController
{
  final _myRepo = ClientImageRepository();
  RxString date = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  get getDate=>date.value;
  setDate(date){
    this.date.value = date;
  }

  RxString imageName = "".obs;


  final rxRequestStatus = Status.LOADING.obs ;
  final imageDetails  = ManualImageModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setBookingDetails(ManualImageModel value) => imageDetails.value = value ;
  void setError(String value) => error.value = value ;


  getData(String siteId,context)
  {
    Map<String,String> data = {
      'site_id':siteId,
      'date':date.value
    };
    setRxRequestStatus(Status.LOADING);
    _myRepo.getManualUploadedImages(data).then((value){
      if(value.code==200)
        {
          setBookingDetails(value);
        }else if(value.code == 202)
          {
            CoolAlert.show(
              context: context,
              type: CoolAlertType.info,
              text: "Please change date for images!",
              title: "Images not available",
            );
          }
      setRxRequestStatus(Status.COMPLETED);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
    });

  }
}