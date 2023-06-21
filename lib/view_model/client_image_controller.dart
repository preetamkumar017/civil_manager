import 'dart:developer';

import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/CctvDetailsModel.dart';
import 'package:civil_manager/respository/client_image_repository.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:ftpconnect/src/dto/ftp_entry.dart';
import 'package:intl/intl.dart';

class ClientImageController extends GetxController {
  final _myRepo = ClientImageRepository();
  Rx<ApiResponse> cctvDetails = ApiResponse.loading().obs;
  Rx<FTPConnect> ftpConnect = FTPConnect('ukcdesigner.in',
          user: 'site_camera@ukcdesigner.in', pass: '(RaytO}cbnzX')
      .obs;

  RxString folderName = "".obs;
  RxString dvrIp = "".obs;
  RxString date = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxList<String> pp = <String>[].obs;
  RxList<FTPEntry> aa = <FTPEntry>[].obs;
  RxString imageName = "".obs;

  setCctvDetails(ctvDetails) => cctvDetails.value = ctvDetails;

  Future<void> fetchCctvDetails(dynamic data,context) async {
    setCctvDetails(ApiResponse.loading());
    _myRepo.fetchCctvDetails(data).then((value) {
      if (value.code == 200) {
        // log(value.result!.toJson().toString());
        setCctvDetails(ApiResponse.completed(value));
        log(cctvDetails.value.data!.result!.folderName ?? "");
        folderName.value = cctvDetails.value.data!.result!.folderName ?? "";
        dvrIp.value = cctvDetails.value.data!.result!.dvrIp ?? "";
        getData(context);
      } else {
        Utils.toastMessage("Something Went Wrong");
      }
    }).onError((error, stackTrace) {
      setCctvDetails(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
      debugPrint(error.toString());
    });
  }

  Future<void> getData(BuildContext context) async {
    // log("${folderName.value}/${dvrIp.value}/${date.value}");
    try {
      await ftpConnect.value.connect();
      bool exist = await ftpConnect.value.checkFolderExistence("${folderName.value}/${dvrIp.value}/${date.value}");
      // log(exist.toString());
      // log("${folderName.value}/${dvrIp.value}/${date.value}");
      if (exist) {
        await ftpConnect.value.changeDirectory(
            "${folderName.value}/${dvrIp.value}/${date.value}");
        aa.value = await ftpConnect.value.listDirectoryContent();

        aa.value.sort((a, b) => b.modifyTime!.compareTo(a.modifyTime!));
        pp.clear();
        for (FTPEntry entry in aa.value) {
          String name = entry.name;
          pp.add(name);
        }

        pp.value = pp.value
            .where(
                (item) => item != '.' && item != '..' && item.endsWith('.jpg'))
            .toList();
        // log(pp.toString());
        // log("${folderName.value}/${dvrIp.value}/${date.value}");
      } else {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.info,
          text: "Please change date for images!",
          title: "Images not available",
        );
      }
    } catch (e) {
      log(e.toString());
      CoolAlert.show(
        context: context,
        type: CoolAlertType.info,
        text: "Please change date for images!",
        title: "Images not available",
      );
    }

    ftpConnect.value.disconnect();
  }
}
