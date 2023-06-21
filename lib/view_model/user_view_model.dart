
import 'package:civil_manager/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  Future<bool> saveUser(UserModel user)async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('id',user.result![0].id ?? "");
    sp.setString('userName',user.result![0].userName ?? "");
    // sp.setString('password',user.result![0].password ?? "");
    sp.setString('mobile',user.result![0].mobile ?? "");
    sp.setString('email',user.result![0].email ?? "");
    sp.setString('userType',user.result![0].userType ?? "");
    sp.setString('designation',user.result![0].designation ?? "");
    sp.setString('accessAuth',user.result![0].accessAuth ?? "");
    sp.setString('profileImg',user.result![0].profileImg ?? "");
    sp.setString('salary',user.result![0].salary ?? "");
    sp.setString('petrolingRate',user.result![0].petrolingRate ?? "");
    sp.setString('accountNo',user.result![0].accountNo ?? "");
    sp.setString('ifscCode',user.result![0].ifscCode ?? "");
    sp.setString('bankName',user.result![0].bankName ?? "");
    sp.setString('bankAddress',user.result![0].bankAddress ?? "");
    sp.setString('joiningDate',user.result![0].joiningDate ?? "");
    sp.setString('ukcid',user.result![0].ukcid ?? "");
    sp.setString('createDate',user.result![0].createDate ?? "");
    sp.setString('updateDate',user.result![0].updateDate ?? "");
    sp.setString('status',user.result![0].status ?? "");
    sp.setString('ip',user.result![0].ip ?? "");
    notifyListeners();
    return true ;
  }

  Future<Result> getUser()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String id = sp.getString('id') ?? "";
    final String userName = sp.getString('userName') ?? "";
    // final String password = sp.getString('password') ?? "";
    final String mobile = sp.getString('mobile') ?? "";
    final String email = sp.getString('email') ?? "";
    final String userType = sp.getString('userType') ?? "";
    final String designation = sp.getString('designation') ?? "";
    final String accessAuth = sp.getString('accessAuth') ?? "";
    final String profileImg = sp.getString('profileImg') ?? "";
    final String salary = sp.getString('salary') ?? "";
    final String petrolingRate = sp.getString('petrolingRate') ?? "";
    final String accountNo = sp.getString('accountNo') ?? "";
    final String ifscCode = sp.getString('ifscCode') ?? "";
    final String bankName = sp.getString('bankName') ?? "";
    final String bankAddress = sp.getString('bankAddress') ?? "";
    final String joiningDate = sp.getString('joiningDate') ?? "";
    final String ukcid = sp.getString('ukcid') ?? "";
    final String createDate = sp.getString('createDate') ?? "";
    final String updateDate = sp.getString('updateDate') ?? "";
    final String status = sp.getString('status') ?? "";
    final String ip = sp.getString('ip') ?? "";

    return Result(
      id:id,
      userName:userName,
      // password:password,
      mobile:mobile,
      email:email,
      userType:userType,
      designation:designation,
      accessAuth:accessAuth,
      profileImg:profileImg,
      salary:salary,
      petrolingRate:petrolingRate,
      accountNo:accountNo,
      ifscCode:ifscCode,
      bankName:bankName,
      bankAddress:bankAddress,
      joiningDate:joiningDate,
      ukcid:ukcid,
      createDate:createDate,
      updateDate:updateDate,
      status:status,
      ip:ip
    );
  }

  Future<bool> remove()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('id');
    sp.remove('userName');
    // sp.remove('password');
    sp.remove('mobile');
    sp.remove('email');
    sp.remove('userType');
    sp.remove('designation');
    sp.remove('accessAuth');
    sp.remove('profileImg');
    sp.remove('salary');
    sp.remove('petrolingRate');
    sp.remove('accountNo');
    sp.remove('ifscCode');
    sp.remove('bankName');
    sp.remove('bankAddress');
    sp.remove('joiningDate');
    sp.remove('ukcid');
    sp.remove('createDate');
    sp.remove('updateDate');
    sp.remove('status');
    sp.remove('ip');
    return true;

  }
}