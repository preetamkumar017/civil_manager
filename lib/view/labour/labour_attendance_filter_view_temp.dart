import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LabourAttendanceFilterView extends StatefulWidget {
  const LabourAttendanceFilterView({Key? key}) : super(key: key);

  @override
  LabourAttendanceFilterViewState createState() =>
      LabourAttendanceFilterViewState();
}

class LabourAttendanceFilterViewState extends State<LabourAttendanceFilterView> {
  DateTime? datePicked;
  String? dropDownValue1;
  String? dropDownValue2;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Attendance List',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Icon(
                      Icons.filter_list_rounded,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 24,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
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
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Select Clients',
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(30, 5, 30, 0),
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
                                  10, 10, 10, 10),
                              child: FlutterFlowDropDown<String>(
                                options: const [
                                  'Ajay Jain',
                                  'Ruchika Sabale',
                                  'Funder',
                                  'Rahul Bansal'
                                ],
                                onChanged: (val) =>
                                    setState(() => dropDownValue1 = val),
                                width: 180,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'Please select...',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(30, 5, 30, 0),
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
                                  10, 10, 10, 10),
                              child: FlutterFlowDropDown<String>(
                                options: const [
                                  'Santosh',
                                  'Suresh',
                                  'Sunil',
                                  'Nikhil',
                                  'Surya'
                                ],
                                onChanged: (val) =>
                                    setState(() => dropDownValue2 = val),
                                width: 180,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'Please select...',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Date Range',
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(30, 5, 30, 0),
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
                            child: InkWell(
                              onTap: () async {
                                final datePickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: getCurrentTimestamp,
                                  lastDate: DateTime(2050),
                                );

                                if (datePickedDate != null) {
                                  setState(
                                    () => datePicked = DateTime(
                                      datePickedDate.year,
                                      datePickedDate.month,
                                      datePickedDate.day,
                                    ),
                                  );
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 0, 10),
                                    child: Text(
                                      'Select Date',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 20, 0),
                                    child: Icon(
                                      Icons.calendar_today_outlined,
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
                              const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FFButtonWidget(
                                onPressed: () {
                                  if (kDebugMode) {
                                    // print('Button pressed ...');
                                  }
                                },
                                text: 'Reset',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  if (kDebugMode) {
                                    // print('Button pressed ...');
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
