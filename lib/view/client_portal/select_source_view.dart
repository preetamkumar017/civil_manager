import 'dart:developer';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:civil_manager/model/user_model.dart';
import 'package:get/get.dart';

class SelectSourceView extends StatefulWidget {
  final Map data;
  const SelectSourceView({Key? key, required this.data}) : super(key: key);

  @override
  _UploadChooseViewWidgetState createState() => _UploadChooseViewWidgetState();
}

class _UploadChooseViewWidgetState extends State<SelectSourceView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  Map result = user.read("user");


  @override
  void initState() {
    // log(widget.data.toString());
    // log(result.toString());
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
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: const BoxDecoration(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color:
                                  FlutterFlowTheme.of(context).highlightColour,
                              size: 20,
                            ),
                            Text(
                              widget.data['full_name'],
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.person_sharp,
                                color: FlutterFlowTheme.of(context)
                                    .highlightColour,
                                size: 20,
                              ),
                              Text(
                                result['user_name'].toString(),
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Map<String, String> pdata = {
                          "site_id": widget.data['site_id'] ?? "",
                          "site_name": widget.data['full_name'] ?? "",
                          "user_name": result['user_name'] ?? "",
                        };
                        Get.toNamed(RoutesName.upload_image_view,arguments: ScreenArguments(pdata));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).highlightColour,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.camera,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 20,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 0, 0),
                                child: Text(
                                  'Upload',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: InkWell(
                      onTap: () {
                        Map<String, String> pdata = {
                          "site_id": widget.data['site_id'] ?? "",
                          "site_name": widget.data['full_name'] ?? "",
                          "user_name": result['user_name'] ?? "",
                        };
                        Get.toNamed(RoutesName.manual_uploaded_image_view,arguments: ScreenArguments(pdata));
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.32,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            boxShadow:  [
                              BoxShadow(
                                blurRadius: 4,
                                color: FlutterFlowTheme.of(context).highlightColour,
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(21),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).highlightColour,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Image.asset(
                                    'assets/images/manual_upload.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height:
                                        MediaQuery.of(context).size.height * 0.2,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 30, 0, 0),
                                child: Text(
                                  'Manual Uploaded  Imaged',
                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: InkWell(
                      onTap: () {
                        Map<String, String> pdata = {
                          "site_id": widget.data['site_id'] ?? "",
                          "site_name": widget.data['full_name'] ?? "",
                          "user_name": result['user_name'] ?? "",
                        };
                        Get.toNamed(RoutesName.cctv_image_view,arguments: ScreenArguments(pdata));
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.32,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            boxShadow:  [
                              BoxShadow(
                                blurRadius: 4,
                                color: FlutterFlowTheme.of(context).highlightColour,
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(21),
                            border: Border.all(
                              color:
                                  FlutterFlowTheme.of(context).highlightColour,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Image.asset(
                                    'assets/images/cctv_upload.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 30, 0, 0),
                                child: Text(
                                  'CCTCV Image upload',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
