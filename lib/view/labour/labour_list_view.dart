import 'package:civil_manager/data/response/status.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
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
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0,right: 25.0,left: 25.0),
                      child: CupertinoSearchTextField(
                        controller: search,
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
                                  height: height,
                                  child: ListView.builder(
                                      itemCount: filteredList.length,
                                      itemBuilder: (context, index) {
                                        var data = filteredList[index];
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
