import 'dart:developer';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:get/get.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class LabourPaymentFilterView extends StatefulWidget {
  const LabourPaymentFilterView({Key? key}) : super(key: key);

  @override
  LabourPaymentFilterViewState createState() => LabourPaymentFilterViewState();
}

class LabourPaymentFilterViewState extends State<LabourPaymentFilterView> {

  TextEditingController siteName = TextEditingController();
  TextEditingController labourHeadName = TextEditingController();
  String? siteId;
  String? labourHeadId;
  DateTime? datePicked;
  String? dropDownValue1;
  String? dropDownValue2;
  String? date;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState.
    // date = DateFormat('dd-MMM-yyyy').format( DateTime.now());

    date= "${DateFormat('dd-MM-yyyy').format(DateTime.now())} To ${DateFormat('dd-MM-yyyy').format(DateTime.now())}";
    siteName = TextEditingController();
    labourHeadName = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    siteName?.dispose();
    labourHeadName?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(onPressed: (){
                            Get.back();
                          }, icon: const Icon(Icons.arrow_back_outlined,color: Colors.white,)),
                          Text(
                            'Labour Payment View',
                            style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Fill the Following for Labour attendance',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Select Date Range',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(30, 5, 30, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 0,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        date ?? "",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final datePickedDate =
                                          await showDateRangePicker(
                                            context: context,
                                            firstDate: DateTime(2000),
                                            lastDate: getCurrentTimestamp,
                                          );

                                          if (datePickedDate != null) {
                                            setState(
                                                    () { datePicked = DateTime(
                                                  datePickedDate.start.year,
                                                  datePickedDate.start.month,
                                                  datePickedDate.start.day,
                                                );
                                                date= "${DateFormat('dd-MM-yyyy').format(DateTime(
                                                  datePickedDate.start.year,
                                                  datePickedDate.start.month,
                                                  datePickedDate.start.day,
                                                ))} To ${DateFormat('dd-MM-yyyy').format(DateTime(
                                                      datePickedDate.end.year,
                                                      datePickedDate.end.month,
                                                      datePickedDate.end.day,
                                                    ))}";
                                                }
                                            );
                                          }

                                        },
                                        child: Icon(
                                          Icons.date_range,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Select Site: ',
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
                                controller: siteName,
                                keyboardType: TextInputType.none,
                                // initialValue: ,
                                onTap: () async {
                                  String data = await Get.toNamed( RoutesName.select_site_view);
                                  Map jsnen = jsonDecode(data);
                                  // setState(() {
                                  siteName?.text = jsnen['full_name'];
                                  siteId= jsnen['id'];
                                  // });
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
                                  hintText: 'Select Site',
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
                              const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () {
                                      // print('Button pressed ...');
                                    },
                                    text: 'Reset',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color:
                                      FlutterFlowTheme.of(context).primaryBtnText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context).primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () {
                                      if (siteName.text == "" ) {
                                        Utils.flushBarErrorMessage(
                                            "Please select labour Head", context);
                                      } else if (labourHeadName.text == "") {
                                        Utils.flushBarErrorMessage(
                                            "Please select labour Head", context);
                                      } else {
                                        Map<String, String> data = {
                                          'submit': "true",
                                          'site_id': siteId.toString(),
                                          'site_name': siteName.text ?? "",
                                          'labour_head_name': labourHeadName.text ?? "",
                                          'labour_head': labourHeadId.toString(),
                                          'date_range': date.toString(),
                                        };

                                        // labourAttendance.labourListForAttendanceApi(data, context);
                                        // log(RoutesName.labour_attendance_screen2_view);
                                        Get.toNamed(
                                          RoutesName.labour_payment_view,
                                          arguments: ScreenArguments(data),
                                        );
                                      }
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
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

          Visibility(
            visible: false,//labourReg.loading,
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
        ],
      ),
    );
  }
}
