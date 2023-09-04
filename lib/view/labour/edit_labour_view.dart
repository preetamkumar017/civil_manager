// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';
import 'dart:developer';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_widgets.dart';
import 'package:civil_manager/view_model/labour_reg_view_model.dart';
import 'package:civil_manager/view_model/status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:civil_manager/model/labour_list_model.dart';

class EditLabourView extends StatefulWidget {
  LabourList data;
  EditLabourView({super.key, required this.data});

  @override
  EditLabourViewState createState() => EditLabourViewState();
}

class EditLabourViewState extends State<EditLabourView> {
  LabourList data = LabourList();
  String id = "";
  TextEditingController labourType = TextEditingController();
  TextEditingController labourHeadName = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController salaryPerDay = TextEditingController();
  TextEditingController address = TextEditingController();

  final jj = TextEditingController();
  String? labourHeadId;
  bool isLabourHead = false;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // final loaderOverlayKey = GlobalKey<ScaffoldState>();

  var sc = StatusController();

  @override
  void initState() {
    super.initState();
    data  = widget.data;
    id = data.id ?? "";
    labourType.text = data.labourType ?? "";
    labourHeadName.text = data.headName ?? "";
    name.text = data.fullName ?? "";
    mobileNumber.text = data.mobile ?? "";
    salaryPerDay.text = data.salary ?? "";
    address.text = data.address ?? "";
    isLabourHead = data.isLabourHead=="Yes";
    labourHeadId = data.labourHead ?? "";

  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    labourType.dispose();
    labourHeadName.dispose();
    name.dispose();
    mobileNumber.dispose();
    salaryPerDay.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final labourReg = Provider.of<LabourRegViewModel>(context);


    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      appBar: AppBar(
        title: Text(
          'Edit Labour Details',
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
      body: Stack(
        children:[
          SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiaryColor,
                shape: BoxShape.rectangle,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Labour Type',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                              child: TextFormField(
                                controller: labourType,
                                keyboardType: TextInputType.none,
                                // initialValue: ,
                                onTap: () async {
                                  String data = await Get.toNamed(
                                      RoutesName.select_labour_type_view);
                                  labourType?.text = data.toString();
                                  log("labourType!.text");
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: const Color(0xFF57636C),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: 'Select Labour Type',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 20, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                maxLines: null,
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsetsDirectional.fromSTEB(30, 5, 30, 0),
                            //   child: Container(
                            //     width: MediaQuery.of(context).size.width,
                            //     height: 50,
                            //     decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       boxShadow: [
                            //         BoxShadow(
                            //           blurRadius: 0,
                            //           color: Color(0x33000000),
                            //           offset: Offset(0, 0),
                            //         )
                            //       ],
                            //       borderRadius: BorderRadius.circular(10),
                            //       border: Border.all(
                            //         color:
                            //         FlutterFlowTheme.of(context).secondaryColor,
                            //       ),
                            //     ),
                            //
                            //    child: Padding(
                            //       padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                            //       child: TextFormField(
                            //         controller: emailAddressController1,
                            //         keyboardType: TextInputType.none,
                            //         onTap: () async {
                            //           var data = await Get.toNamed(RoutesName.select_view) ;
                            //           Map jsnen = jsonDecode(data) ;
                            //           log(jsnen['id'] ?? " ");
                            //           emailAddressController1?.text = jsnen['full_name'] ?? "";
                            //         },
                            //         obscureText: false,
                            //         decoration: InputDecoration(
                            //           isDense: true,
                            //           labelStyle: FlutterFlowTheme.of(context)
                            //               .bodyText1
                            //               .override(
                            //             fontFamily: 'Lexend Deca',
                            //             color: Color(0xFF57636C),
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.normal,
                            //           ),
                            //           hintText: 'Enter Full Name',
                            //           hintStyle: FlutterFlowTheme.of(context)
                            //               .bodyText1
                            //               .override(
                            //             fontFamily: 'Roboto',
                            //             color: Colors.black,
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.normal,
                            //           ),
                            //           enabledBorder: OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //               color: FlutterFlowTheme.of(context)
                            //                   .secondaryColor,
                            //               width: 1,
                            //             ),
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //           focusedBorder: OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //               color: FlutterFlowTheme.of(context)
                            //                   .secondaryColor,
                            //               width: 1,
                            //             ),
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //           errorBorder: OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //               color: Color(0x00000000),
                            //               width: 1,
                            //             ),
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //           focusedErrorBorder: OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //               color: Color(0x00000000),
                            //               width: 1,
                            //             ),
                            //             borderRadius: BorderRadius.circular(8),
                            //           ),
                            //           filled: true,
                            //           fillColor: Colors.white,
                            //           contentPadding:
                            //           EdgeInsetsDirectional.fromSTEB(24, 24, 20, 0),
                            //         ),
                            //         style:
                            //         FlutterFlowTheme.of(context).bodyText1.override(
                            //           fontFamily: 'Poppins',
                            //           fontWeight: FontWeight.normal,
                            //         ),
                            //         maxLines: null,
                            //       ),
                            //     ),
                            //     // child: Padding(
                            //     //   padding: EdgeInsetsDirectional.fromSTEB(
                            //     //       10, 10, 10, 10),
                            //     //   child: FlutterFlowDropDown<String>(
                            //     //     options: [],
                            //     //     onChanged: (val) =>
                            //     //         setState(() => dropDownValue1 = val),
                            //     //     width: 180,
                            //     //     height: 50,
                            //     //     textStyle: FlutterFlowTheme.of(context)
                            //     //         .bodyText1
                            //     //         .override(
                            //     //       fontFamily: 'Poppins',
                            //     //       color: Colors.black,
                            //     //       fontWeight: FontWeight.normal,
                            //     //     ),
                            //     //     hintText: 'Please select...',
                            //     //     fillColor: Colors.white,
                            //     //     elevation: 2,
                            //     //     borderColor: Colors.transparent,
                            //     //     borderWidth: 0,
                            //     //     borderRadius: 0,
                            //     //     margin: EdgeInsetsDirectional.fromSTEB(
                            //     //         12, 4, 12, 4),
                            //     //     hidesUnderline: true,
                            //     //   ),
                            //     // ),
                            //   ),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Labour Head',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin:
                                  const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                              child: TextFormField(
                                controller: labourHeadName,
                                onTap: () async {
                                  var data = await Get.toNamed(
                                      RoutesName.select_labour_head_view);
                                  Map jsnen = jsonDecode(data);
                                  log(jsnen['full_name'] ?? " ");
                                  labourHeadName?.text = jsnen['full_name'];
                                  labourHeadId = jsnen['id'];
                                  // labourHeadName!.text="sfsaf";
                                },
                                keyboardType: TextInputType.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: const Color(0xFF57636C),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: 'Select Labour Head',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 20, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                maxLines: null,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Full Name',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                              child: TextFormField(
                                controller: name,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: const Color(0xFF57636C),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: 'Enter Full Name',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 20, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                maxLines: null,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Mobile Number',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                              child: TextFormField(
                                controller: mobileNumber,
                                obscureText: false,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: const Color(0xFF57636C),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: 'Enter Mobile Number',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 20, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                maxLines: null,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Salary(Per Day)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                              child: TextFormField(
                                controller: salaryPerDay,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: const Color(0xFF57636C),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: 'Enter Salary',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 20, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                maxLines: null,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Address',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                              child: TextFormField(
                                controller: address,
                                obscureText: false,
                                keyboardType: TextInputType.streetAddress,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  hintText: 'Enter Address',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      24, 24, 20, 0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: null,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                      unselectedWidgetColor: const Color(0xFFF5F5F5),
                                    ),
                                    child: Checkbox(
                                      value: isLabourHead ??= false,
                                      onChanged: (newValue) async {
                                        setState(
                                            () => isLabourHead = newValue!);
                                      },
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      checkColor:Colors.white,

                                    ),
                                  ),
                                  Text(
                                    'Is  Labour Head?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        30, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  50, 0, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              // print('Button pressed ...');
                                              Get.back();
                                            },
                                            text: 'Cancel',
                                            options: FFButtonOptions(
                                              width: 100,
                                              height: 40,
                                              color: Colors.white,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (labourType.text == "") {
                                                Utils.flushBarErrorMessage(
                                                    "Please Select Labour Type",
                                                    context);
                                              } else if (labourHeadName.text == "") {
                                                Utils.flushBarErrorMessage(
                                                    "Please Select Labour Head",
                                                    context);
                                              } else if (name.text == "") {
                                                Utils.flushBarErrorMessage(
                                                    "Please Enter full name",
                                                    context);
                                              }
                                              // else if (mobileNumber.text == "") {
                                              //   Utils.flushBarErrorMessage(
                                              //       "Please Enter mobile Number",
                                              //       context);
                                              // }
                                              else if (salaryPerDay.text == "") {
                                                Utils.flushBarErrorMessage(
                                                    "Please Enter Salary per day",
                                                    context);
                                              }
                                              else if (address.text == "") {
                                                Utils.flushBarErrorMessage(
                                                    "Please Enter Address",
                                                    context);
                                              }
                                              else {
                                                Map data = {
                                                  'submit': "true",
                                                  'id':id,
                                                  'labour_type':labourType.text,
                                                  'labour_head':labourHeadId,
                                                  'full_name': name.text,
                                                  'mobile': mobileNumber.text,
                                                  'salary': salaryPerDay.text,
                                                  'address':address.text,
                                                  'is_labour_head': isLabourHead ?"Yes":"No",
                                                };


                                                // context.loaderOverlay.show();
                                                  await labourReg.labourRegApi( data, context);

                                                      // Navigator.of(context).pop();
                                                       // Navigator.pushNamed(context, RoutesName.labour_list_view);

                                                   // print(labourReg.status);
                                              }
                                            },
                                            text: 'Save',
                                            options: FFButtonOptions(
                                              width: 100,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

            Visibility(
              visible: labourReg.loading,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white70,
                child: const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            )
        ]
      ),
    );
  }
}
