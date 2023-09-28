import 'dart:convert';
import 'dart:developer';

import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/res/components/general_exception.dart';
import 'package:civil_manager/res/components/internet_exceptions_widget.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/thekedar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:civil_manager/model/thekedar_list_model.dart';

class ThekedarListView extends StatefulWidget {
  const ThekedarListView({super.key});

  @override
  State<ThekedarListView> createState() => _ThekedarListViewState();
}

class _ThekedarListViewState extends State<ThekedarListView> {
  final tdc = Get.put(ThekedarController());

  @override
  void initState() {
    // TODO: implement initState
    tdc.getThekedarList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Select Site"),
          centerTitle: true,
        ),

        body: Container(
          child: Obx(() {
            switch (tdc.rxRequestStatus1.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                if (tdc.error.value == 'No internet') {
                  return InterNetExceptionWidget(
                    onPress: () {
                      tdc.getThekedarList();
                    },
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {
                    // homeController.refreshApi();

                    tdc.getThekedarList();
                  });
                }
              case Status.COMPLETED:
                if (tdc.workList1.value.thekedar != null) {

                  return  ListView.builder(
                    itemCount: tdc.workList1.value.thekedar!.length,
                    itemBuilder: (context, index) {

                      final bool isEven = index % 2 == 0;
                      Color? color = isEven ? Colors.white : Colors.grey[100];

                      Thekedar data =  tdc.workList1.value.thekedar![index];

                      return Container(
                        color: color,
                        child: ListTile(
                          onTap: () {
                            Get.back(result: data.fullName);
                          },
                          title: Text( data.fullName ?? "",style: FlutterFlowTheme.of(context).subtitle1,),
                          iconColor: FlutterFlowTheme.of(context).primaryBackground,
                          trailing: const Icon(Icons.arrow_forward,weight: 2.0,size: 30),
                          leading: const Icon(Icons.home),
                          splashColor: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                      );
                    },
                  );
                } else {
                  return Text("No data Found");
                }
            }
          }),
        ),
      ),
    );
  }
}
