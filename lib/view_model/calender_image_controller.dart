import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/image_calender_model.dart';
import 'package:civil_manager/respository/client_image_repository.dart';
import 'package:civil_manager/view/client_portal/calender_view.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_util.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalenderImageController extends GetxController {
  final _myRepo = ClientImageRepository();
  RxString date = DateFormat('yyyy-MM').format(DateTime.now()).obs;
  get getDate => date.value;
  setDate(date) {
    this.date.value = date;
  }

  RxList<Meeting> meetings = <Meeting>[].obs;
  get getMeeting => meetings;

  Rx<MeetingDataSource> mts = MeetingDataSource([]).obs;

  final rxRequestStatus = Status.LOADING.obs;
  final imageDetails = ImageCalenderModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setBookingDetails(ImageCalenderModel value) =>
      imageDetails.value = value;
  void setError(String value) => error.value = value;

  Future<void> getData(String siteId, context) async {
    Map<String, String> data = {'site_id': siteId, 'date': date.value};
    setRxRequestStatus(Status.LOADING);
    _myRepo.getManualUploadedImagesCalender(data).then((value) {
      if (value.code == 200) {
        setBookingDetails(value);
        if (imageDetails.value.result != null &&
            imageDetails.value.result!.isNotEmpty) {
          meetings.value = [];
          imageDetails.value.result!.forEach((element) {
            final DateTime today = DateTime.parse(element.dateTime ?? "");
            final DateTime startTime =
                DateTime(today.year, today.month, today.day);
            final DateTime endTime = startTime.add(const Duration(hours: 2));
            meetings.add(Meeting("${element.remark ?? "No Remark"}", startTime, endTime,
                element.remark==null ?
                Color(0xFFF872A7):
                Color(0xFF26C5DE), true));
          });
          mts.value = MeetingDataSource(meetings);
        }
      } else if (value.code == 202) {
        setBookingDetails(ImageCalenderModel());
        CoolAlert.show(
          context: context,
          type: CoolAlertType.info,
          text: "Please Change Month!",
          title: "Data Not available",
        );
      }
      setRxRequestStatus(Status.COMPLETED);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
    });
  }
}
