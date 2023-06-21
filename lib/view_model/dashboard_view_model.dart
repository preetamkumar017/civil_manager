import 'package:civil_manager/data/response/api_response.dart';
import 'package:civil_manager/model/dashboard_model.dart';
import 'package:civil_manager/respository/dashboard_repository.dart';
import 'package:flutter/material.dart';

class DashboardViewModel with ChangeNotifier
{
    final _myRepo = DashboardRepository();

    ApiResponse<DashboardModel> dashboardList = ApiResponse.loading();

    setDashboardList(ApiResponse<DashboardModel> response){
        dashboardList = response ;
        notifyListeners();
    }


    Future<void> fetchDashboardListApi ()async{
        setDashboardList(ApiResponse.loading());

        _myRepo.fetchDashboard().then((value){
            setDashboardList(ApiResponse.completed(value));

        }).onError((error, stackTrace){
            setDashboardList(ApiResponse.error(error.toString()));
        });
    }




}