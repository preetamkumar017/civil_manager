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
import 'package:civil_manager/view_model/thekedar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ThekedarImageView extends StatefulWidget {

  const ThekedarImageView({Key? key})
      : super(key: key);

  @override
  _ThekedarImageViewState createState() =>
      _ThekedarImageViewState();
}

class _ThekedarImageViewState extends State<ThekedarImageView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final wLController = Get.put(ThekedarController());

  @override
  void initState() {
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
        appBar: AppBar(
            title: const Text("Thekedar Uploaded Images"),
            centerTitle: true,
            backgroundColor: FlutterFlowTheme.of(context).tertiary),
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

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:wLController.imageList.value.length,
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
                   String data =  wLController.imageList[index];
                   return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {
                            Map<String, String> da = {
                              'image':
                              "${AppUrl.subMainUrl}/assets/site_images/thekedar/${data}"
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
                                "${AppUrl.subMainUrl}/assets/site_images/thekedar/${data}",
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
            ),
          ),
        ),
      ),
    );
  }
}