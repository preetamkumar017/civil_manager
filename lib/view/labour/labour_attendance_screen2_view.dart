import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_widgets.dart';
import 'package:civil_manager/view_model/labour_list_for_attendence_view_model.dart';
import 'package:civil_manager/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../model/labour_list_for_attendance_model.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:civil_manager/model/user_model.dart';

class LabourAttendanceScreen2View extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  const LabourAttendanceScreen2View({Key? key, required this.data}) : super(key: key);

  @override
  LabourAttendanceScreen2ViewState createState() => LabourAttendanceScreen2ViewState();
}

class LabourAttendanceScreen2ViewState
    extends State<LabourAttendanceScreen2View> {
  final LabourListForAttendanceViewModel _labourListForAttendanceViewModel = LabourListForAttendanceViewModel();

  final TextEditingController note = TextEditingController();
  final TextEditingController oth = TextEditingController();

  int i = 0;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final search = TextEditingController();

  @override
  void initState() {
    _labourListForAttendanceViewModel.labourListForAttendanceApi(widget.data, context);
    super.initState();
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    _labourListForAttendanceViewModel.dispose();
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // log(widget.data['labour_head_name'] ?? "");
    // final labourAddAttendanceViewModel = Provider.of<LabourListForAttendanceViewModel>(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    // log(_labourListForAttendanceViewModel.loading.toString());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      body: Stack(
        children:[
          SafeArea(
            child: ListView(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(25, 20, 30, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                      Text(
                        'Labour Attendance ',
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  Icon(
                                    Icons.calendar_today,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      widget.data['hdn_att_date'],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: FlutterFlowTheme.of(context).secondaryText,
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

                              Row(
                                children: [
                                  FFButtonWidget(
                                    onPressed: ()
                                    async {
                                      Result result = await  UserViewModel().getUser();
                                      if (_labourListForAttendanceViewModel.getAllPresent().any((value) => value) ||
                                          _labourListForAttendanceViewModel.getAllHalfDay().any((value) => value) ||
                                          _labourListForAttendanceViewModel.getAllNigh().any((value) => value) ||
                                          _labourListForAttendanceViewModel.getAllOt().any((value) => value)){
                                      Map data = {
                                        "l_id":
                                            _labourListForAttendanceViewModel
                                                .getAllId(),
                                        "hdn_p":
                                            _labourListForAttendanceViewModel
                                                .getAllPresent(),
                                        "hdn_h":
                                            _labourListForAttendanceViewModel
                                                .getAllHalfDay(),
                                        "hdn_n":
                                            _labourListForAttendanceViewModel
                                                .getAllNigh(),
                                        // "hdn_o":
                                        //     _labourListForAttendanceViewModel
                                        //         .getAllOt(),
                                        "lab_work":
                                            _labourListForAttendanceViewModel
                                                .getAllNote(),
                                        "lab_work_oth":
                                            _labourListForAttendanceViewModel
                                                .getAllOth(),
                                        "hdn_att_date":
                                            widget.data['hdn_att_date'],
                                        "hdn_labour_head":
                                            widget.data['labour_head'],
                                        "hdn_site_id": widget.data['site_id'],
                                        "user_id": result.id ?? "",
                                        "user_name": result.userName ?? ""
                                      };
                                      // Map userData = user.read("user");
                                      // log(data.toString());

                                      dynamic jsonData = jsonEncode(data);
                                      Get.toNamed(
                                          RoutesName.labour_image_capture_view,
                                          arguments:
                                              ScreenArgumentsString(jsonData));

                                      // labourAddAttendanceViewModel.labourAddAttendanceApi(jsonData, context);
                                    }else
                                      {
                                        Utils.flushBarErrorMessage("Please mark attendance for at least one person.", context);
                                      }
                                  },
                                    text: 'Submit',
                                    options: FFButtonOptions(
                                      width: 80,
                                      height: 30,
                                      color: FlutterFlowTheme.of(context).primaryColor,
                                      textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context).primaryBtnText,
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 30, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    margin: EdgeInsets.only(right: 10,left: 15),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                                    child: Text(
                                      'Name ',
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
                                    Text(
                                      'OT',
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

                        Padding(
                          padding: const EdgeInsets.only(top: 5.0,right: 25.0,left: 25.0),
                          child: CupertinoSearchTextField(
                            controller: search,
                            onChanged: (value) {
                              _labourListForAttendanceViewModel.setSearch(value);
                            },
                          ),
                        ),



                        Container(
                          height: height-260,
                          child: ChangeNotifierProvider<LabourListForAttendanceViewModel>(
                            create: (context) => _labourListForAttendanceViewModel,
                            child: Consumer<LabourListForAttendanceViewModel>(
                              builder: (context, value, _) {
                                var data = value.labourList.data?.labourList!;
                                switch (value.labourList.status) {
                                  case Status.LOADING:
                                    return const Center(child: CircularProgressIndicator());
                                  case Status.ERROR:
                                    return Center(
                                        child: Text(value.labourList.message.toString()));
                                  case Status.COMPLETED:
                                    while (i < data!.length) {
                                      String id = value.labourList.data!.labourList![i].id.toString();
                                      i++;
                                      _labourListForAttendanceViewModel.setDefaultPresent(id);
                                    }

                                    return ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        if( data[index].fullName!.toLowerCase().contains(search.text.toLowerCase()))
                                          {return Container(
                                            margin: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(
                                                color: const Color(0xFFF1F4F8),
                                                width: 2,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                                      15, 10, 0, 0),
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
                                                            5, 0, 0, 0),
                                                        child: Text(
                                                          data[index].fullName ?? "",
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
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                                      15, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                0.25,
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
                                                                  .fromSTEB(20, 2, 2, 2),
                                                              child: Text(
                                                                data[index].labourType ?? "",
                                                                style:
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: FlutterFlowTheme
                                                                      .of(context)
                                                                      .secondaryText,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Theme(
                                                              data: ThemeData(
                                                                checkboxTheme: CheckboxThemeData(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                FlutterFlowTheme.of(context)
                                                                    .tertiaryColor,
                                                              ),
                                                              child: Checkbox(
                                                                value:
                                                                _labourListForAttendanceViewModel
                                                                    .getPresent(index),
                                                                onChanged: (value) {
                                                                  _labourListForAttendanceViewModel
                                                                      .setpresent(index);
                                                                },
                                                                activeColor:
                                                                FlutterFlowTheme.of(context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                            Theme(
                                                              data: ThemeData(
                                                                checkboxTheme: CheckboxThemeData(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                FlutterFlowTheme.of(context)
                                                                    .tertiaryColor,
                                                              ),
                                                              child: Checkbox(
                                                                value:
                                                                _labourListForAttendanceViewModel
                                                                    .getHalfDay(index),
                                                                onChanged: (value) {
                                                                  _labourListForAttendanceViewModel
                                                                      .setHalfDay(index);
                                                                },
                                                                activeColor:
                                                                FlutterFlowTheme.of(context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                            Theme(
                                                              data: ThemeData(
                                                                checkboxTheme: CheckboxThemeData(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                FlutterFlowTheme.of(context)
                                                                    .tertiaryColor,
                                                              ),
                                                              child: Checkbox(
                                                                value:
                                                                _labourListForAttendanceViewModel
                                                                    .getNigh(index),
                                                                onChanged: (newValue) async {

                                                                  if (newValue!) {
                                                                    _showMyDialog(newValue, index);
                                                                  }else
                                                                  {
                                                                    _labourListForAttendanceViewModel
                                                                        .setNight(index);
                                                                    _labourListForAttendanceViewModel.setNote(index, "");
                                                                  }
                                                                },
                                                                activeColor:
                                                                FlutterFlowTheme.of(context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                            Theme(
                                                              data: ThemeData(
                                                                checkboxTheme: CheckboxThemeData(
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                FlutterFlowTheme.of(context)
                                                                    .tertiaryColor,
                                                              ),
                                                              child: Checkbox(
                                                                value:
                                                                _labourListForAttendanceViewModel
                                                                    .getOt(index),
                                                                onChanged: (newValue) async {

                                                                  if (newValue!) {
                                                                    _showMyDialog1(newValue, index);
                                                                  }else
                                                                  {
                                                                    _labourListForAttendanceViewModel
                                                                        .setOt(index);
                                                                    _labourListForAttendanceViewModel.setOth(index, "");
                                                                  }
                                                                },
                                                                activeColor:
                                                                FlutterFlowTheme.of(context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if(_labourListForAttendanceViewModel.getNote(index)!="") Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                                      15, 0, 0, 10),
                                                  child: Text(
                                                    _labourListForAttendanceViewModel.getNote(index).toString(),
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
                                                ),
                                               if(_labourListForAttendanceViewModel.getOth(index)!="") Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                                      15, 0, 0, 10),
                                                  child: Text(
                                                    _labourListForAttendanceViewModel.getOth(index).toString(),
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
                                                ),
                                              ],
                                            ),
                                          );
                                        }else
                                          {
                                            return SizedBox();
                                          }
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _labourListForAttendanceViewModel.addLoading,
              child: Center(
                child: Container(
                    height: Get.height,
                    width: Get.width,
                    color:Colors.white60,
                    child: const Center(child: CircularProgressIndicator(),)),
              ))
        ]
      ),
    );
  }


  Future<void> _showMyDialog(bool value, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text('Enter Note'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[

                TextFormField(
                  controller: note,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Write Your Message here.......',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
          ),
          actions: <Widget>[

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: ()
                    {
                      if(note.text!="") {

                        _labourListForAttendanceViewModel
                            .setNight(index);
                        _labourListForAttendanceViewModel.setNote(
                            index, note.text);
                        note.text = "";
                      }
                      Get.back();

                    },
                    text: 'Submit',
                    options: FFButtonOptions(
                      width: 80,
                      height: 30,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontWeight: FontWeight.normal,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
,
                ],
              ),
            ),
          ],
        );
      },
    );
  }
  Future<void> _showMyDialog1(bool value, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text('Enter Note'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[

                TextFormField(
                  controller: oth,
                  autofocus: true,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Write Total Hours .......',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
          ),
          actions: <Widget>[

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: ()
                    {
                      if(oth.text!="") {

                        _labourListForAttendanceViewModel.setOt(index);

                        _labourListForAttendanceViewModel.setOth(index, oth.text);
                        oth.text = "";
                      }
                      Get.back();

                    },
                    text: 'Submit',
                    options: FFButtonOptions(
                      width: 80,
                      height: 30,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontWeight: FontWeight.normal,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
,
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
