import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_util.dart';
import 'package:civil_manager/view_model/labour_list_view_model.dart';
import 'package:get/get.dart';
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

  @override
  void initState() {
    labourViewModel.fatchLabourListApi();
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.fromSTEB(25, 20, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.arrow_back_outlined,color: Colors.white,)),
                    Text(
                      'Labour List ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          context.pushNamed('Labourlistfilter');
                        },
                        child: const Icon(
                          Icons.filter_list_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height ,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
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

                              return Expanded(
                                child: SizedBox(
                                  height: height,
                                  child: ListView.builder(
                                      itemCount: value
                                          .labourList.data!.labourList!.length,
                                      itemBuilder: (context, index) {
                                        var data = value.labourList.data!
                                            .labourList![index];
                                        return Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(25, 25, 25, 0),
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
                                                                    12,
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
                                                                                  'Type: ${data.labourType}',
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
                                                                              Text(
                                                                                '${data.address}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
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
                                        );
                                      }),
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
            ],
          ),
        ),
      ),
    );
  }
}
