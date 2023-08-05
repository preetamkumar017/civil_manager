import 'dart:developer';

import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/res/app_url.dart';
import 'package:civil_manager/res/components/general_exception.dart';
import 'package:civil_manager/res/components/internet_exceptions_widget.dart';
import 'package:civil_manager/res/components/no_data_found_exception.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/manual_uploaded_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ManualImageUploadedView extends StatefulWidget {
  final Map data;

  const ManualImageUploadedView({Key? key, required this.data})
      : super(key: key);

  @override
  _ManualImageUploadedViewState createState() =>
      _ManualImageUploadedViewState();
}

class _ManualImageUploadedViewState extends State<ManualImageUploadedView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  ManualUploadedController clientImageViewModel =
  Get.put(ManualUploadedController());

  @override
  void initState() {
    log(widget.data.toString());
    clientImageViewModel.getData(widget.data['site_id'], context);
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.059,
                  decoration: const BoxDecoration(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.location_on,
                              color:
                              FlutterFlowTheme.of(context).highlightColour,
                              size: 20.0,
                            ),
                            Text(
                              widget.data['site_name'],
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.person_sharp,
                                color: FlutterFlowTheme.of(context)
                                    .highlightColour,
                                size: 20.0,
                              ),
                              Text(
                                widget.data['user_name'],
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2030));

                        if (pickedDate != null) {
                          log(pickedDate.toString());
                          clientImageViewModel.date.value =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          clientImageViewModel.getData(
                              widget.data['site_id'], context);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).highlightColour,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Obx(() {
                          return Text(
                            DateFormat('dd-MMM-yyyy').format(DateTime.parse(
                                clientImageViewModel.date.value)),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  switch (clientImageViewModel.rxRequestStatus.value) {
                    case Status.LOADING:
                      return const Center(child: CircularProgressIndicator());
                    case Status.ERROR:
                      if (clientImageViewModel.error.value == 'No internet') {
                        return InterNetExceptionWidget(
                          onPress: () {
                            // homeController.refreshApi();

                            clientImageViewModel.getData(
                                widget.data['site_id'], context);
                          },
                        );
                      } else {
                        return GeneralExceptionWidget(onPress: () {
                          // homeController.refreshApi();

                          clientImageViewModel.getData(
                              widget.data['site_id'], context);
                        });
                      }
                    case Status.COMPLETED:
                      log(clientImageViewModel.imageDetails.value
                          .toJson()
                          .toString());
                      if (clientImageViewModel.imageDetails.value.result != null) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: ListView.builder(
                                shrinkWrap: false,
                                itemCount: clientImageViewModel.imageDetails.value.result!.length,
                                itemBuilder:(context, idx)   {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: Get.width,
                                          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            // color: Colors.brown[400],
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Text("Remark:- ${clientImageViewModel.imageDetails.value.result![idx].remark ?? " Not Available"}",
                                            style: const TextStyle(
                                              // color: Colors.white,
                                                fontSize: 15
                                            ),
                                          )),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: clientImageViewModel.imageDetails.value.result![idx].imageList!.length,
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 0.1,
                                          childAspectRatio: 1.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          String data =  clientImageViewModel.imageDetails.value.result![idx].imageList![index];
                                          // log(AppUrl.subMainUrl+"/assets/site_images/manual_upload/"+ data.imageName.toString());
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Map<String, String> da = {
                                                    'image':
                                                    "${AppUrl.subMainUrl}/assets/site_images/manual_upload/${data}"
                                                  };
                                                  log("message");
                                                  Get.toNamed(RoutesName.image_viewer,
                                                      arguments: ScreenArguments(da));
                                                },
                                                child: Container(
                                                  width:
                                                  MediaQuery.of(context).size.width *
                                                      0.8,
                                                  height:
                                                  MediaQuery.of(context).size.height *
                                                      0.17,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                    border: Border.all(
                                                      width: 3.0,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(13.0),
                                                    child: Image.network(
                                                      "${AppUrl.subMainUrl}/assets/site_images/manual_upload/${data}",
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width * 0.7,
                                                      height: MediaQuery.of(context)
                                                          .size
                                                          .height * 0.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Center(
                                              //   child: Text(
                                              //     data ?? "",
                                              //     style: FlutterFlowTheme.of(context)
                                              //         .labelMedium,
                                              //     overflow: TextOverflow.ellipsis,
                                              //   ),
                                              // ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                }
                            ),
                          ),
                        );
                      } else {
                        return NoDataFoundExceptionWidget(onPress: () {
                          clientImageViewModel.getData(
                              widget.data['site_id'], context);
                        });
                      }
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}