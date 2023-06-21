import 'dart:developer';

import 'package:civil_manager/model/user_model.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashServices {


  Future<Result> getUserDate() => UserViewModel().getUser();


  void checkAuthentication(BuildContext context)async{

    getUserDate().then((value)async{

      if (kDebugMode) {
        // print(value.email.toString());
      }

      if(value.email.toString() == 'null' || value.email.toString() == ''){
        await Future.delayed(const Duration(seconds: 3));
        Get.offNamed(RoutesName.login_view);
      }else {
        await  Future.delayed(const Duration(seconds: 3));
        log("dashboard");
        Get.offNamed(RoutesName.dashboard_view);
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        // print(error.toString());
      }
    });

  }



}