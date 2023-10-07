import 'dart:developer';

import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/res/components/general_exception.dart';
import 'package:civil_manager/res/components/internet_exceptions_widget.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/thekedar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:civil_manager/model/thekedar_work_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkCompletedListView extends StatefulWidget {
  final Map data;
  const WorkCompletedListView({super.key,required this.data});

  @override
  State<WorkCompletedListView> createState() => _WorkCompletedListViewState();
}

class _WorkCompletedListViewState extends State<WorkCompletedListView> {
  final wLController = Get.put(ThekedarController());

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
   log(widget.data.toString());
   wLController.setSiteId = widget.data['site_id'];
   wLController.thekedarName.value.text = "";
    wLController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Completed Work List"),
          centerTitle: true,
          backgroundColor: FlutterFlowTheme.of(context).tertiary),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8, 8, 8),
            child: CupertinoSearchTextField(
              controller: wLController.thekedarName.value,
              keyboardType: TextInputType.none,
              onTap: () async {
                String data =   await  Get.toNamed(RoutesName.thekedar_list_view);
                wLController.thekedarName.value.text = data;
                setState(() {});
              },
              onChanged: (value) async {

                String data =   await  Get.toNamed(RoutesName.thekedar_list_view);
                wLController.thekedarName.value.text = data;
                setState(() {});
              },
            )
          ),
          const Divider(
            color: Colors.black,
            thickness: 1, // You can adjust the thickness as needed
          ),
          Expanded(
            child: Obx(() {
              switch (wLController.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  if (wLController.error.value == 'No internet') {
                    return InterNetExceptionWidget(
                      onPress: () {
                        wLController.getData();
                      },
                    );
                  } else {
                    return GeneralExceptionWidget(onPress: () {
                      // homeController.refreshApi();

                      wLController.getData();
                    });
                  }
                case Status.COMPLETED:
                  if (wLController.workList.value.result != null) {
                    return Obx(() {
                      return ListView.builder(
                        itemCount: wLController.workList.value.result!.length,
                        itemBuilder: (context, index) {
                          Result result = wLController.workList.value.result![index];
                          if(wLController.thekedarName.value.text=="")
                            {
                              return _myCard(result);
                            }else if(result.fullName ==wLController.thekedarName.value.text)
                              {
                                log(result.fullName ?? "");
                                return _myCard(result);
                              }else
                                {
                                  return Container();
                                }
                        },
                      );
                    });
                  } else {
                    return const Text("No data Found");
                  }
              }
            }),
          ),
        ],
      ),
    );
  }
  Widget _myCard(Result  result)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 1.5,bottom: 3),
      child: InkWell(
        onLongPress: () {
          remark.text = result.approvalRemark ?? "";
              showBottom(result);

        },
        onTap: () {
          wLController.imageList.value = result.workImage!.split(",");
          log(wLController.imageList.value.length.toString());
          Get.toNamed(RoutesName.thekedar_image_view);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Site:-",style: FlutterFlowTheme.of(context).labelLarge,),
                        Text(result.siteName ?? "",style: FlutterFlowTheme.of(context).labelMedium,),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Date:-",style: FlutterFlowTheme.of(context).labelLarge),
                        Text(result.createDate ?? "",style: FlutterFlowTheme.of(context).labelMedium,),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Work:-",style: FlutterFlowTheme.of(context).labelLarge),
                        Text("${result.workComplete} ${result.rateUnit}",style: FlutterFlowTheme.of(context).labelMedium,),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Rate:-",style: FlutterFlowTheme.of(context).labelLarge),
                        Text("${result.thekaRate}/${result.rateUnit}",style: FlutterFlowTheme.of(context).labelMedium,),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Total Amount:-",style: FlutterFlowTheme.of(context).labelLarge),
                    Text("${result.workAmount}",style: FlutterFlowTheme.of(context).labelLarge,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Remark:-",style: FlutterFlowTheme.of(context).labelLarge),
                    Expanded(child: Text("${result.remark ?? ""}",style: FlutterFlowTheme.of(context).labelLarge,
                    )),
                  ],
                ),
                if(result.isApproved=="1")Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Approved By:-",style: FlutterFlowTheme.of(context).labelLarge),
                            Text("${result.approveBy}",style: const TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                        const Row(
                          children: [
                            Text("Approved",style: TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Approval Remark:-",style: FlutterFlowTheme.of(context).labelLarge),
                        Expanded(
                          child: Text(
                              "${result.approvalRemark ?? ""}",style: const TextStyle(
                            fontFamily:  'Poppins',
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
                if(result.isApproved=="2")Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Disapprove By:-",style: FlutterFlowTheme.of(context).labelLarge),
                            Text("${result.approveBy}",style: const TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                        const Row(
                          children: [
                            Text("Disapproved",style: TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Approval Remark:-",style: FlutterFlowTheme.of(context).labelLarge),
                            Text(result.approvalRemark ?? "",style: const TextStyle(
                              fontFamily:  'Poppins',
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showBottom(Result result) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(onPressed: () async{
                Get.back();

                getRemark(result,"1");
              }, child: const Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded,color: Color(0xff1DA1F2)),
                  SizedBox(width: 8,),
                  Text("Approve",style: TextStyle(color: Color(0xff1DA1F2)),),
                ],
              )),
              TextButton(onPressed: () async {
                Get.back();
                getRemark(result,"2");

              }, child: const Row(
                children: [
                  Icon(Icons.image,color:  Colors.redAccent,),
                  SizedBox(width: 8,),
                  Text("Disapprove",style: TextStyle(color: Colors.redAccent,),),
                ],
              )),

            ],
          ),
        );
      },
    );
  }

final TextEditingController remark = TextEditingController();
  Future<void> getRemark(Result result, String is_approved) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Remark'),
          content:  TextField(
            maxLines: 2,
            controller: remark,
            decoration: const InputDecoration(labelText: 'Enter your remark',
                border: OutlineInputBorder()
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                if(remark.text != "") {
                  final SharedPreferences sp = await SharedPreferences.getInstance();
                  Map data = {
                    "id":result.id,
                    "is_approved":is_approved,
                    "approval_remark":remark.text,
                    "approve_by":sp.getString('userName')
                  };
                  wLController.approve(data);
                  remark.text = "";
                  Navigator.of(context).pop();
                }else
                {
                  Utils.flushBarErrorMessage("Remark cannot be left blank", context);
                }// Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

}

