// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use_from_same_package

import 'dart:developer';
import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/res/app_url.dart';
import 'package:civil_manager/res/components/pdf_viewer.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:civil_manager/view_model/labour_payment_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:civil_manager/model/labour_payment_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LabourPaymentView extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  const LabourPaymentView({Key? key, required this.data}) : super(key: key);

  @override
  LabourPaymentViewState createState() => LabourPaymentViewState();
}

class LabourPaymentViewState extends State<LabourPaymentView> {
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final LabourPaymentListViewModel _labourListAfterAttendanceViewModel =
      LabourPaymentListViewModel();

  final search = TextEditingController();
  List<LabourList> filteredList = [];
  @override
  void initState() {
    _labourListAfterAttendanceViewModel.fatchLabourListWithDataApi(widget.data);
    super.initState();
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    _labourListAfterAttendanceViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.data.toString());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
            child: ListView(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(25, 20, 30, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,
                          )),
                      Text(
                        'Labour Payment',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).alternate,
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Date between: ${widget.data['date_range']}",
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 10, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5, 0, 0, 0),
                                      child: Text(
                                        widget.data['site_name'],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 30, 0),
                                      child: IconButton(
                                        onPressed: () {
                                          var date;
                                          Utils.flushBarInfoMessage(
                                              "Please wait File downloading...",
                                              context);
                                          if (widget.data['date_range'] != "") {
                                            date = widget.data['date_range'];
                                            date =
                                                "${date.replaceAll('-', '/')}";
                                            date =
                                                "${date.replaceAll('To', '-')}";
                                            log("${AppUrl.pdfDownloadPaymentEndPoint}?site_id=${widget.data['site_id']}&labour_head_id=${widget.data['labour_head']}&date_range=$date");
                                          }
                                          // log(date);
                                          log("${AppUrl.pdfDownloadPaymentEndPoint}?site_id=${widget.data['site_id']}&labour_head_id=${widget.data['labour_head_id']}&date_range=$date");
                                          openFile(
                                              url:
                                                  "${AppUrl.pdfDownloadPaymentEndPoint}?site_id=${widget.data['site_id']}&labour_head_id=${widget.data['labour_head_id']}&date_range=$date",
                                              fileName:
                                                  'labour-payment-${DateTime.now().millisecondsSinceEpoch.toString()}.pdf',
                                              isPDF: true);
                                        },
                                        icon: Icon(
                                          Icons.picture_as_pdf,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        var date;
                                        Utils.flushBarInfoMessage(
                                            "Please wait File downloading...",
                                            context);
                                        if (widget.data['date_range'] != "") {
                                          date = widget.data['date_range'];
                                          date = "${date.replaceAll('-', '/')}";
                                          date =
                                              "${date.replaceAll('To', '-')}";
                                          log("${AppUrl.excelDownloadPaymentEndPoint}?site_id=${widget.data['site_id']}&labour_head_id=${widget.data['labour_head']}&date_range=$date");
                                        }

                                        openFile(
                                            url:
                                                "${AppUrl.excelDownloadPaymentEndPoint}?site_id=${widget.data['site_id']}&labour_head_id=${widget.data['labour_head_id']}&date_range=$date",
                                            fileName:
                                                'labour-payment-${DateTime.now().millisecondsSinceEpoch.toString()}.xlsx',
                                            isPDF: false);
                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.solidFileExcel,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Text(
                                    widget.data['labour_head_name'],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ChangeNotifierProvider<LabourPaymentListViewModel>(
                            create: (context) =>
                                _labourListAfterAttendanceViewModel,
                            child: Consumer<LabourPaymentListViewModel>(
                              builder: (context, value, _) {
                                switch (value.labourList.status) {
                                  case Status.LOADING:
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  case Status.ERROR:
                                    return Center(
                                        child: Text(value.labourList.message
                                            .toString()));
                                  case Status.COMPLETED:
                                   Result kk = value.labourList.data!.result!;
                                    return Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 10, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Mistri:- ${kk.mishtriCount}",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Text(
                                            "Reja:- ${kk.rezaCount}",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Text(
                                            "kuli:- ${kk.kuliCount}",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    );
                                  default:
                                    break;
                                }

                                return Container();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15, 5, 30, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                        child: Text(
                                          'Labour Name',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Present',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                        ),
                                        Text(
                                          'Half',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                        ),
                                        Text(
                                          'Night',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, right: 25.0, left: 25.0, bottom: 5.0),
                            child: CupertinoSearchTextField(
                              controller: search,
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: Get.height,
                              child: ChangeNotifierProvider<
                                  LabourPaymentListViewModel>(
                                create: (context) =>
                                    _labourListAfterAttendanceViewModel,
                                child: Consumer<LabourPaymentListViewModel>(
                                  builder: (context, value, _) {
                                    switch (value.labourList.status) {
                                      case Status.LOADING:
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      case Status.ERROR:
                                        return Center(
                                            child: Text(value.labourList.message
                                                .toString()));
                                      case Status.COMPLETED:
                                        filteredList = value.labourList.data!
                                            .result!.labourList!;
                                        if (search.text.isEmpty) {
                                          // If search text is empty, show the full list
                                          filteredList = value.labourList.data!
                                              .result!.labourList!;
                                        } else {
                                          filteredList = value.labourList.data!
                                              .result!.labourList!
                                              .where((item) => item.labourName!
                                                  .toLowerCase()
                                                  .contains(search.text
                                                      .toLowerCase()))
                                              .toList();
                                        }
                                        return ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: filteredList.length,
                                          itemBuilder: (context, index) {
                                            var present = double.parse(
                                                    filteredList[index]
                                                            .tpresent ??
                                                        "") +
                                                double.parse(filteredList[index]
                                                        .thalfday ??
                                                    "") +
                                                double.parse(filteredList[index]
                                                        .tnight ??
                                                    "");
                                            return Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(15, 2, 15, 3),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xFFF1F4F8),
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 5, 0, 5),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                18, 10, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons.person,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                              size: 18,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                      2,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Text(
                                                                filteredList[
                                                                            index]
                                                                        .labourName ??
                                                                    "",
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                18, 0, 15, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.15,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.03,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              2,
                                                                              2,
                                                                              2),
                                                                      child:
                                                                          Text(
                                                                        filteredList[index].labourType ??
                                                                            "",
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 14,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        5,
                                                                        0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      filteredList[index]
                                                                              .tpresent ??
                                                                          "",
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                    Text(
                                                                      filteredList[index]
                                                                              .thalfday ??
                                                                          "",
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                    Text(
                                                                      filteredList[index]
                                                                              .tnight ??
                                                                          "",
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                18, 0, 15, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Total Present: ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  present
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Total Payment:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  ' ₹ ${filteredList[index].salary ?? ""}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      default:
                                        break;
                                    }

                                    return Container();
                                  },
                                ),
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
          ),
        ),
      ),
    );
  }

  Future openFile(
      {required String url, String? fileName, required bool isPDF}) async {
    final file = await downloadFile(url, fileName!);
    log(url);
    if (file == null) return;
    if (await Permission.mediaLibrary.isGranted) {
      if (isPDF)
        Get.to(() => PDFFileScreen(
              path: file.path,
            ));
    }

    log('Path: ${file.path}');
    Utils.toastMessage("Successfully downloaded to: ${file.path}");

    // OpenFile.open(file.path);
    // OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    // print(url);
    final appStorage = await AndroidPathProvider.downloadsPath;
    final file = File('$appStorage/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }
}
