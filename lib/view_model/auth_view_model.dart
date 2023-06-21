

import 'package:civil_manager/model/user_model.dart';
import 'package:civil_manager/respository/auth_repository.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:civil_manager/view_model/services/storage.dart';
import 'package:civil_manager/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  bool _loading = false ;
  bool get loading => _loading ;

  bool _signUpLoading = false ;
  bool get signUpLoading => _signUpLoading ;


  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data , BuildContext context) async {

    setLoading(true);

    _myRepo.loginApi(data).then((value){
      setLoading(false);
      if(value.code==200)
        {
          final userPreference = Provider.of<UserViewModel>(context , listen: false);
          userPreference.saveUser( UserModel(code: value.code,status: value.status,message: value.message, result: value.result));
          user.write("user", value.result![0]);
          Get.offAllNamed(RoutesName.dashboard_view);
        }else if(value.code==402)
          {
            Utils.flushBarErrorMessage(value.message.toString(), context);
          }else
            {
              Utils.flushBarInfoMessage(value.message.toString(), context);
            }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        // print(error.toString());
      }

    });
  }


  Future<void> signUpApi(dynamic data , BuildContext context) async {

    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.add_labour_view);
      if(kDebugMode){
        // print(value.toString());

      }
    }).onError((error, stackTrace){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        // print(error.toString());
      }

    });
  }

}