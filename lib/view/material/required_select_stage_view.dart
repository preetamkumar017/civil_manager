// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:developer';
import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/res/components/text_style.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/select_labour_head_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RequiredSelectStageView extends StatefulWidget {
  final Map<String,String> data;

   const RequiredSelectStageView({Key? key,required this.data}) : super(key: key);

  @override
  State<RequiredSelectStageView> createState() => _RequiredSelectStageViewState();
}

class _RequiredSelectStageViewState extends State<RequiredSelectStageView> {
  SelectViewModel selectView = SelectViewModel();
  @override
  void initState() {
    Map<String,String> data = {
      "site_id":widget.data['site_id'].toString(),
    };
    selectView.fetchStageListApi(data);
    super.initState();
  }


  @override
  void dispose() {
    selectView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

        appBar: AppBar(
          title: Text(
            'Select Stage ',
            style: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Roboto',
              color: FlutterFlowTheme.of(context).primaryBtnText,
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
          ),
          elevation: 0,
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        ),
        body: ChangeNotifierProvider<SelectViewModel>(
          create: (context) => selectView,
          child: Consumer<SelectViewModel>(
            builder: (context, value, _) {
              switch (value.stageList.status) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return SingleChildScrollView(
                    child: Center(
                        child: Text(value.stageList.message.toString())),
                  );
                case Status.COMPLETED:
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: value.stageList.data!.floor!.length ,
                    itemBuilder: (context, floor) {
                      // if(floor!=0)
                      // {
                      var val1 = value.stageList.data!.floor![floor];
                      log("message");
                      // print(val1.toJson().toString());
                        return ExpansionTile(
                          initiallyExpanded: true,
                          title:Text("${addOrdinalSuffix(int.parse(val1.floorNum ?? ""))} Floor",style: FlutterFlowTheme.of(context).subtitle1,),
                          children: [

                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.stageList.data!.result!.length,
                              itemBuilder: (context, index) {
                                var val  = value.stageList.data!.result![index];
                                if(val1.floorNum==val.floorNum)
                                  {
                                    return ListTile(
                                      iconColor: FlutterFlowTheme.of(context).primaryBackground,
                                      trailing: const Icon(Icons.arrow_forward,weight: 2.0,size: 30),
                                      title: Text(val.stageName ?? "",style: FlutterFlowTheme.of(context).subtitle2,),
                                      onTap: () {
                                        // Utils.flushBarSuccessMessage(widget.data['site_id'].toString()+" "+floor.toString()+" "+stage.toString(), context);
                                        Map<String,String> argdata = {
                                          "site_id":widget.data['site_id'].toString(),
                                          "site_name":widget.data['full_name'].toString(),
                                          "total_floor":widget.data['floor'].toString(),
                                          "floor":val.floorNum.toString(),
                                          "stage":val.stageId.toString(),
                                          "stage_name":val.stageName.toString(),
                                        } ;
                                        log(argdata.toString());

                                        Get.toNamed(RoutesName.request_form_view,arguments: ScreenArguments(argdata));
                                      },
                                    );
                                  }else
                                    {
                                      return const SizedBox();
                                    }
                            },)

                            // ListTile(
                            //   iconColor: FlutterFlowTheme.of(context).primaryBackground,
                            //   trailing: Icon(Icons.arrow_forward,weight: 2.0,size: 30),
                            //   title: Row(
                            //     children: [
                            //       Text(val.stageName ?? "",style: FlutterFlowTheme.of(context).subtitle2,),
                            //       Container(
                            //         height:30,
                            //         width: 30,
                            //         margin: EdgeInsets.all(5.0),
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(100),
                            //           border: Border.all(
                            //             color: FlutterFlowTheme.of(context).primaryBackground,
                            //             width: 2.0
                            //           ),
                            //
                            //         ),
                            //         child: Center(child: Text(val.cnt ?? "",style: TextStyle(
                            //           color: FlutterFlowTheme.of(context).primaryColor,
                            //           fontWeight: FontWeight.bold,
                            //         ),)),
                            //       ),
                            //     ],
                            //   ),
                            //   onTap: () {
                            //     // Utils.flushBarSuccessMessage(widget.data['site_id'].toString()+" "+floor.toString()+" "+stage.toString(), context);
                            //     Map<String,String> argdata = {
                            //       "site_id":widget.data['site_id'].toString(),
                            //       "site_name":widget.data['full_name'].toString(),
                            //       "total_floor":widget.data['floor'].toString(),
                            //       "floor":val.floorNum.toString(),
                            //       "stage":val.stageId.toString(),
                            //       "stage_name":val.stageName.toString(),
                            //     } ;
                            //     log(argdata.toString());
                            //
                            //     Get.toNamed(RoutesName.request_form_view,arguments: ScreenArguments(argdata));
                            //   },
                            // ),
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   physics: NeverScrollableScrollPhysics(),
                            //   scrollDirection: Axis.vertical,
                            //   itemCount: value.stageList.data!.result!.length,
                            //   itemBuilder: (context, stage) {
                            //     var data = value.stageList.data!.result![stage];
                            //     if(stage!=0)
                            //       {
                            //           return ListTile(
                            //             title: Text(data.stageName ?? ""),
                            //             trailing: IconBadge(
                            //               icon: Icon(Icons.notifications_none,),
                            //               itemCount: 12,
                            //               badgeColor: Colors.white,
                            //               itemColor: Colors.red,
                            //               hideZero: true,
                            //             ),
                            //             onTap: () {
                            //               // Utils.flushBarSuccessMessage(widget.data['site_id'].toString()+" "+floor.toString()+" "+stage.toString(), context);
                            //             Map<String,String> argdata = {
                            //               "site_id":widget.data['site_id'].toString(),
                            //               "site_name":widget.data['full_name'].toString(),
                            //               "total_floor":widget.data['floor'].toString(),
                            //               "floor":floor.toString(),
                            //               "stage":data.stageId.toString(),
                            //               "stage_name":data.stageName.toString(),
                            //             } ;
                            //             log(argdata.toString());
                            //
                            //             Get.toNamed(RoutesName.request_form_view,arguments: ScreenArguments(argdata));
                            //             },
                            //           );
                            //         }
                            //     else
                            //       {
                            //         return SizedBox();
                            //       }
                            //
                            //
                            //
                            //   },
                            // )
                          ],
                        );
                      // }
                      // else
                      //   {
                      //     return ExpansionTile(
                      //       // leading: Icon(Icons.),
                      //       title:Text(NumberToWordsEnglish.convert(floor)+" Floor"),
                      //       children: [
                      //         ListView.builder(
                      //           shrinkWrap: true,
                      //           physics: NeverScrollableScrollPhysics(),
                      //           scrollDirection: Axis.vertical,
                      //           itemCount: value.stageList.data!.result!.length,
                      //           itemBuilder: (context, stage) {
                      //             var data = value.stageList.data!.result![stage];
                      //             return ListTile(
                      //               title: Text(data.stageName ?? ""),
                      //               trailing: IconBadge(
                      //                 icon: Icon(Icons.notifications_none),
                      //                 itemCount: 12,
                      //                 badgeColor: Colors.red,
                      //                 itemColor: Colors.white,
                      //                 hideZero: true,
                      //               ),
                      //               onTap: () {
                      //                 Map<String,String> argdata = {
                      //                   "site_id":widget.data['site_id'].toString(),
                      //                   "site_name":widget.data['full_name'].toString(),
                      //                   "total_floor":widget.data['floor'].toString(),
                      //                   "floor":floor.toString(),
                      //                   "stage":data.stageId.toString(),
                      //                   "stage_name":data.stageName.toString(),
                      //                 } ;
                      //
                      //                 Get.toNamed(RoutesName.request_form_view,arguments: ScreenArguments(argdata));
                      //               },
                      //
                      //             );
                      //
                      //
                      //           },
                      //         )
                      //       ],
                      //       // backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
                      //
                      //     );
                      //   }
                  },);

                default:
                  break;
              }
              return Container();
            },
          ),
        ));
  }
}
