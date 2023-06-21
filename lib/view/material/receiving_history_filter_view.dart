import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_util.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceivingHistoryFilterView extends StatefulWidget {
  const ReceivingHistoryFilterView({Key? key}) : super(key: key);

  @override
  ReceivingHistoryFilterViewState createState() =>
      ReceivingHistoryFilterViewState();
}

class ReceivingHistoryFilterViewState
    extends State<ReceivingHistoryFilterView> {

  TextEditingController siteName = TextEditingController();
  String siteId = "";
  String floorNum = "";
  TextEditingController floorName = TextEditingController();
  String floor = "";
  TextEditingController stageName = TextEditingController();
  String stageId = "";

  DateTime? datePicked;
  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;
  String? date;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    siteName.dispose();
    floorName.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      appBar: AppBar(
        title: Text(
          'Receiving History Filter',
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
      body: SafeArea(
        child: ListView(
          children: [
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
                              'Select Sites',
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20, 0, 20, 0),
                        child: TextFormField(
                          controller: siteName,
                          keyboardType: TextInputType.none,
                          // initialValue: ,
                          onTap: () async {
                            String data = await Get.toNamed( RoutesName.select_site_view);
                            Map jsnen = jsonDecode(data);
                            // print(jsnen.toString());
                            siteName.text = jsnen['full_name'];
                            siteId= jsnen['id'];
                            floorNum= jsnen['floorNum'];
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Select Floor',
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20, 0, 20, 0),
                        child: TextFormField(
                          controller: floorName,
                          keyboardType: TextInputType.none,
                          // initialValue: ,
                          onTap: () async {
                            Map<String,String> floordata = {'floorttl':floorNum};
                            String data = await Get.toNamed( RoutesName.select_floor_view, arguments: ScreenArguments(floordata),);
                            Map jsnen = jsonDecode(data);
                            // print(jsnen.toString());
                            floorName.text = jsnen['floorName'];
                           floor = jsnen['floorNum'];
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Select Work Stage',
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20, 0, 20, 0),
                        child: TextFormField(
                          controller: stageName,
                          keyboardType: TextInputType.none,
                          // initialValue: ,
                          onTap: () async {
                            Map<String,String> floordata = {'site_id':siteId};
                            String data = await Get.toNamed( RoutesName.select_stage_view, arguments: ScreenArguments(floordata),);
                            Map jsnen = jsonDecode(data);
                            // print(jsnen.toString());
                            stageName.text = jsnen['stageName'];
                            stageId = jsnen['stageId'];
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Date range:',
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
                      const SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                Map<String,String> filter ={
                                  "site_id":siteId,
                                  "floor_num":floor,
                                  "stage_id":stageId,
                                  "daterange":date.toString()
                                };
                                // print(filter.toString());
    // '{
    // "site_id":"${siteId}",
    // "floor_num":"${floor}",
    // "stage_id":"${stageId}",
    // "daterange":"${date.toString()}"
    // }'

                                Get.back(result: filter,canPop: true);
                              },
                              text: 'Show Result',
                              options: FFButtonOptions(
                                width: 150,
                                height: 40,
                                color:
                                FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                                elevation: 2,
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
    );
  }
}
