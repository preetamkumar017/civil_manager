// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';
import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/res/app_url.dart';
import 'package:civil_manager/res/components/pdf_viewer.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_util.dart';
import 'package:civil_manager/view/labour/my_dialog.dart';
import 'package:civil_manager/view_model/labour_list_for_attendence_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:civil_manager/model/labour_list_after_attendance_model.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class AttendanceListView extends StatefulWidget {
  final Map<dynamic, dynamic> data;
   const AttendanceListView({Key? key,required this.data}) : super(key: key);

  @override
  AttendanceListViewState createState() => AttendanceListViewState();
}

class AttendanceListViewState extends State<AttendanceListView> with TickerProviderStateMixin {


  final LabourListForAttendanceViewModel _labourListAfterAttendanceViewModel =
  LabourListForAttendanceViewModel();
  late AnimationController controller;

  bool? checkboxValue1;
  bool? checkboxValue2;
  bool? checkboxValue3;

  int i = 0;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String? currentdate;
  String preDate ="";
  bool da = false;

  @override
  void initState() {
    _labourListAfterAttendanceViewModel.labourListAfterAttendanceApi(widget.data, context);
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 500);
    controller.reverseDuration = const Duration(milliseconds: 500);
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
          child: ListView(
            // mainAxisSize: MainAxisSize.max,
            // physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25, 20, 30, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                    Text(
                      'Attendance List',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                    //   child: InkWell(
                    //     onTap: () async {
                    //       context.pushNamed('labourattenfilter');
                    //     },
                    //     child: const Icon(
                    //       Icons.filter_list_rounded,
                    //       color: Colors.white,
                    //       size: 24,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.88,
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      widget.data['site_name'],
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 15, 0),
                                    child: IconButton(
                                      onPressed: (){
                                         var date;
                                          Utils.flushBarInfoMessage( "Please wait File downloading...", context);
                                          log(widget.data['date_range']);
                                         
                                          if (widget.data['date_range']!="") {
                                            date=  widget.data['date_range'];
                                            date = "${date.replaceAll('-', '/')}";
                                            date = "${date.replaceAll('To', '-')}";
                                            // log("${AppUrl.pdfDownloadAttendanceEndPoint}?site_id=${ widget.data['site_id']}&labour_head_id=${ widget.data['labour_head']}&date_range=${date}");
                                          }
                                          String url = "${AppUrl.pdfDownloadAttendanceEndPoint}?site_id=${widget.data['site_id']}&labour_head_id=${widget.data['labour_head_id']}&date_range=$date";
                                          log(url);
                                          openFile(
                                              url: url,
                                              fileName:
                                              'labour-attendance-${DateTime.now().millisecondsSinceEpoch.toString()}.pdf');

                                      },
                                      icon: Icon(
                                        Icons.picture_as_pdf,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  // IconButton(
                                  //   onPressed: () async {
                                  //     final SharedPreferences sp = await SharedPreferences.getInstance();
                                  //     final String id = sp.getString('id') ?? "";
                                  //     final String userName = sp.getString('userName') ?? "";
                                  //     Map data={
                                  //       "l_id":_labourListAfterAttendanceViewModel.getAllId(),
                                  //       "delete": _labourListAfterAttendanceViewModel.getAllDelete(),
                                  //       "user_id":id,
                                  //       "user_name":userName
                                  //     };
                                  //     dynamic  jsondata =jsonEncode(data);
                                  //     _labourListAfterAttendanceViewModel.labourDeleteAttendanceApi(jsondata, context).then((value){
                                  //       Get.back();
                                  //
                                  //       // _labourListAfterAttendanceViewModel.labourListAfterAttendanceApi(widget.data, context);
                                  //     });
                                  //   },
                                  //   icon: const Icon(
                                  //     Icons.delete,
                                  //     color: Color(0xFFFF0000),
                                  //     size: 24,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.person,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 30, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
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
                                              color: FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
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
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                    Text(
                                      'Half',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                    Text(
                                      'Night',
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
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: Get.height,
                            child: ChangeNotifierProvider<LabourListForAttendanceViewModel>(
                              create: (context) => _labourListAfterAttendanceViewModel,
                              child: Consumer<LabourListForAttendanceViewModel>(
                                builder: (context, value, _) {
                                  switch (value.labourListAfterAttendance.status) {
                                    case Status.LOADING:
                                      return const Center(child: CircularProgressIndicator());
                                    case Status.ERROR:
                                      return Center(
                                          child: Text(value.labourList.message.toString()));
                                    case Status.COMPLETED:

                                      var data =   value.labourListAfterAttendance.data!.result;
                                      // _labourListAfterAttendanceViewModel.clearIdDelete();
                                      while (i < data!.length) {
                                        String id = data[i].id.toString();
                                        i++;
                                        _labourListAfterAttendanceViewModel.setIdDelete(id);
                                      }
                                      return ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: data.length,
                                        itemBuilder: (context, index) {
                                          currentdate=data[index].attandanceDate;
                                          if(preDate != currentdate)
                                            {
                                              da = true;
                                              preDate = currentdate!;
                                            }else
                                              {
                                                da= false;
                                              }

                                          return Column(
                                            children: [
                                             da ? Padding(
                                                  padding: const EdgeInsets.only(left: 15.0),
                                                  child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text( DateFormat('dd-MMM-yyyy').format( DateTime.parse(data[index].attandanceDate ?? ""))  ,
                                                      style: FlutterFlowTheme.of(context)
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme.of(context)
                                                            .tertiaryColor,
                                                      ),
                                                    ),
                                                  ],
                                              ),
                                                ):const SizedBox(),
                                              InkWell(
                                                onTap: () {
                                                  change(data[index].id ?? "",data[index]);
                                                },
                                                child: Slidable(
                                                  endActionPane: ActionPane(
                                                    motion: const ScrollMotion(),
                                                    children: [
                                                      SlidableAction(
                                                        onPressed: (context) {
                                                          Map<String,String> imgData = {
                                                            'image':"${AppUrl.subMainUrl}assets/site_images/attandance_images/${data[index].imageName ?? ""}"
                                                          };

                                                          Get.toNamed(RoutesName.image_viewer,arguments: ScreenArguments(imgData));

                                                        },
                                                        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                        foregroundColor: Colors.white,
                                                        icon: Icons.image_outlined,
                                                        label: 'View Image',
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        title:  Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                              15, 0, 0, 0),
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                              Icon(
                                                                Icons.person,
                                                                color: FlutterFlowTheme.of(context)
                                                                    .tertiaryColor,
                                                                size: 18,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(
                                                                    2, 0, 0, 0),
                                                                child: Text(
                                                                  data[index].labourName ?? "",
                                                                  style: FlutterFlowTheme.of(context)
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily: 'Poppins',
                                                                    color:
                                                                    FlutterFlowTheme.of(context)
                                                                        .primaryText,
                                                                    fontSize: 15,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        subtitle:  Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(
                                                                  15, 0, 15, 0),
                                                              child: Row(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  // Theme(
                                                                  //   data: ThemeData(
                                                                  //     checkboxTheme: CheckboxThemeData(
                                                                  //       shape: RoundedRectangleBorder(
                                                                  //         borderRadius:
                                                                  //         BorderRadius.circular(0),
                                                                  //       ),
                                                                  //     ),
                                                                  //     unselectedWidgetColor:
                                                                  //     FlutterFlowTheme.of(context)
                                                                  //         .tertiaryColor,
                                                                  //   ),
                                                                  //   child: Checkbox(
                                                                  //     value:
                                                                  //     _labourListAfterAttendanceViewModel
                                                                  //         .getDelete(index),
                                                                  //     onChanged: (value) {
                                                                  //       _labourListAfterAttendanceViewModel
                                                                  //           .setDelete(index);
                                                                  //     },
                                                                  //     activeColor:
                                                                  //     FlutterFlowTheme.of(context)
                                                                  //         .primaryColor,
                                                                  //   ),
                                                                  // ),
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment.start,
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
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                            FlutterFlowTheme.of(context)
                                                                                .primaryBtnText,
                                                                          ),
                                                                          child: Padding(
                                                                            padding: const EdgeInsetsDirectional
                                                                                .fromSTEB(0, 2, 2, 2),
                                                                            child: Text(
                                                                              data[index].labourType ?? "",
                                                                              style: FlutterFlowTheme.of(
                                                                                  context)
                                                                                  .bodyText1
                                                                                  .override(
                                                                                fontFamily: 'Poppins',
                                                                                color:
                                                                                FlutterFlowTheme.of(
                                                                                    context)
                                                                                    .secondaryText,
                                                                                fontSize: 14,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment.spaceBetween,
                                                                      children: [

                                                                        Visibility(visible: data[index].present=="1",replacement: Icon(Icons.close,color: FlutterFlowTheme.of(context).secondaryBackground,),child: Icon(Icons.check,color: FlutterFlowTheme.of(context).primaryColor,),),

                                                                        Visibility(visible: data[index].halfday=="0.5",replacement: Icon(Icons.close,color: FlutterFlowTheme.of(context).secondaryBackground,),child: Icon(Icons.check,color: FlutterFlowTheme.of(context).primaryColor,),),

                                                                        Visibility(visible: data[index].night=="1",replacement: Icon(Icons.close,color: FlutterFlowTheme.of(context).secondaryBackground,),child: Icon(Icons.check,color: FlutterFlowTheme.of(context).primaryColor,),),

                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            data[index].labourWork!="" ?  Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 10),
                                                              child: Text(
                                                                data[index].labourWork ?? "",
                                                                style: FlutterFlowTheme.of(context)
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: FlutterFlowTheme.of(context)
                                                                      .secondaryText,
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.normal,
                                                                ),
                                                              ),
                                                            ):const SizedBox.shrink(),
                                                          ],
                                                        ),

                                                      ),
                                                      const Divider(
                                                        color: Colors.grey,
                                                        height: 1,
                                                        thickness: 1,
                                                      ),
                                                    ],
                                                  ),

                                                ),
                                              ),
                                            ],
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
    );
  }
  
  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);
    if (file == null) return;
    Get.to(()=>PDFFileScreen(path: file.path));

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


  void change(String id,Result data)
  {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        transitionAnimationController: controller,
        context: context,
        builder: (BuildContext context1) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.of(context1).pop();
                    // _labourListAfterAttendanceViewModel.labourListAfterAttendanceApi(widget.data, context);
                    // Map data = {'attendance_id':id};
                   await _dialogBuilder(context,data);

                    _labourListAfterAttendanceViewModel.labourListAfterAttendanceApi(widget.data, context);

                  },
                  child: Row(
                    children: [
                      Icon(Icons.edit,color: FlutterFlowTheme.of(context).success,),
                      const SizedBox(width: 10,),
                      Text("Edit",style: FlutterFlowTheme.of(context).labelMedium)
                    ],
                  ),
                ),
                InkWell(
                 onTap: () {
                    Navigator.of(context).pop();
                    // _labourListAfterAttendanceViewModel.labourListAfterAttendanceApi(widget.data, context);
                   Map data = {'attendance_id':id};
                       _labourListAfterAttendanceViewModel.labourDeleteAttendanceApi(data, context).then((value){
                         // Get.back();
                         _labourListAfterAttendanceViewModel.labourListAfterAttendanceApi(widget.data, context);
                       });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.delete,color: FlutterFlowTheme.of(context).error,),
                      const SizedBox(width: 10,),
                      Text("Delete",style: FlutterFlowTheme.of(context).labelMedium)
                    ],
                  ),
                ),
              ],
            ),
          );
        });

  }

  Future<void> _dialogBuilder(BuildContext context,Result data) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return MyDialog(data);
      },
    );
  }

}
