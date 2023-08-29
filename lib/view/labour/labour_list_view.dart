import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/model/labour_list_model.dart';
import 'package:civil_manager/view_model/labour_list_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LabourListView extends StatefulWidget {
  const LabourListView({Key? key}) : super(key: key);

  @override
  LabourListViewState createState() => LabourListViewState();
}

class LabourListViewState extends State<LabourListView>
    with TickerProviderStateMixin {
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LabourListViewModel labourViewModel = LabourListViewModel();
  final search = TextEditingController();
  List<LabourList> filteredList = [];
  late AnimationController controller;

  @override
  void initState() {
    labourViewModel.fatchLabourListApi();
    controller = BottomSheet.createAnimationController(this);
    // controller.duration = const Duration(milliseconds: 500);
    // controller.reverseDuration = const Duration(milliseconds: 500);
    super.initState();
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    labourViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    // var width = size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      appBar: AppBar(
        title: Text("Labour List",
          style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Roboto',
            color: FlutterFlowTheme.of(context).alternate,
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  borderRadius: const BorderRadius.only(
                    // bottomLeft: Radius.circular(20),
                    // bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0,right: 25.0,left: 25.0),
                      child: CupertinoSearchTextField(
                        controller: search,
                        autofocus: false,
                        onChanged: (value) {
                          setState(() {

                          });
                        },
                      ),
                    ),
                    ChangeNotifierProvider<LabourListViewModel>(
                      create: (context) => labourViewModel,
                      child: Consumer<LabourListViewModel>(
                        builder: (context, value, _) {
                          switch (value.labourList.status) {
                            case Status.LOADING:
                              return const Center(
                                  child: CircularProgressIndicator());
                            case Status.ERROR:
                              return Center(
                                  child: Text(
                                      value.labourList.message.toString()));
                            case Status.COMPLETED:
                              // print(value.labourList.data!.labourList!.length
                              //     .toString());
                              // filteredList.clear();
                            if (search.text.isEmpty) {
                                // If search text is empty, show the full list
                                filteredList = value.labourList.data!.labourList!;
                                } else {
                                filteredList = value.labourList.data!.labourList!
                                    .where((item) => item.fullName!.toLowerCase().contains(search.text.toLowerCase()))
                                    .toList();
                                }

                              return Expanded(
                                child: SizedBox(
                                  height: height*2,
                                  child: RefreshIndicator(
                                    onRefresh: () async {

                                      await labourViewModel.fatchLabourListApi();
                                    },
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: filteredList.length,
                                          itemBuilder: (context, index) {
                                            LabourList data = filteredList[index];
                                            return InkWell(
                                              onTap: () {
                                                change(data);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(25, 10, 25, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color:
                                                                  Color(0x33000000),
                                                              offset: Offset(0, 2),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16),
                                                          border: Border.all(
                                                            color:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                  4, 4, 4, 4),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize.max,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                          16,
                                                                          8,
                                                                          16,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsetsDirectional.fromSTEB(
                                                                                  0,
                                                                                  0,
                                                                                  0,
                                                                                  5),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize
                                                                                    .max,
                                                                            children: [

                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Text(
                                                                                      data.fullName ?? "",
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      style: FlutterFlowTheme.of(context)
                                                                                          .bodyText1
                                                                                          .override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context)
                                                                                            .tertiaryColor,
                                                                                        fontSize: 20,
                                                                                      ),
                                                                                    ),
                                                                                  ),


                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Mo. :',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                      ),
                                                                                      Text(
                                                                                        '${data.mobile}',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                    0,
                                                                                    2,
                                                                                    0,
                                                                                    0),
                                                                                child:
                                                                                    Row(
                                                                                  mainAxisSize:
                                                                                      MainAxisSize.max,
                                                                                  mainAxisAlignment:
                                                                                      MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Head:',
                                                                                            style:
                                                                                            FlutterFlowTheme.of(context).bodyText1,
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Text(
                                                                                              data.headName ?? "",
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                              style: FlutterFlowTheme.of(context)
                                                                                                  .bodyText1
                                                                                                  .override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context)
                                                                                                    .tertiaryColor,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),

                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Type: ${data.labourType}',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                    0,
                                                                                    2,
                                                                                    0,
                                                                                    0),
                                                                                child:
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                  mainAxisSize:
                                                                                          MainAxisSize.max,
                                                                                  children: [
                                                                                        Text(
                                                                                          'Salary: ',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        ),
                                                                                        Text(
                                                                                          '\u{20B9}${data.salary}',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                        ),
                                                                                  ],
                                                                                ),
                                                                                        Row(
                                                                                  mainAxisSize:
                                                                                          MainAxisSize.max,
                                                                                  children: [
                                                                                        Text(
                                                                                          'Labour Head: ',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                        ),
                                                                                        Text(
                                                                                          data.isLabourHead == "Yes"?'Yes':'No',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              ),
                                                                                        ),
                                                                                  ],
                                                                                ),
                                                                                      ],
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                    0,
                                                                                    2,
                                                                                    0,
                                                                                    0),
                                                                                child:
                                                                                    Row(
                                                                                  mainAxisSize:
                                                                                      MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Address:',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        '${data.address}',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            ),
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              );

                            default:
                              break;
                          }
                          return Container();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void change(LabourList result)
  {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        transitionAnimationController: controller,
        context: context,
        builder: (BuildContext context) {
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
                    Navigator.of(context).pop();
                    // _labourListAfterAttendanceViewModel.labourListAfterAttendanceApi(widget.data, context);
                    // Map data = result.toJson();
                    await Navigator.pushNamed(context, RoutesName.edit_labour_view,arguments: result);
                    labourViewModel.fatchLabourListApi();
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
                    Map data = {'id':result.id};
                    labourViewModel.labourDeleteApi(data, context).then((value){
                      // Get.back();


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

}
