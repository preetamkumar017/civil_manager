// ignore_for_file: use_build_context_synchronously

import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/res/app_url.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_util.dart';
import 'package:civil_manager/view_model/receiving_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ReceivingHistoryView extends StatefulWidget {
  const ReceivingHistoryView({Key? key}) : super(key: key);

  @override
  State<ReceivingHistoryView> createState() => _ReceivingHistoryViewState();
}

class _ReceivingHistoryViewState extends State<ReceivingHistoryView> {
  ReceivingHistoryViewModel receivingHistoryViewModel = ReceivingHistoryViewModel();
  Map<String,String> data = {};

  @override
  void initState() {
    receivingHistoryViewModel.receivedMaterialApi(data, context);
    super.initState();
  }

  @override
  void dispose() {
    receivingHistoryViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Receiving History',
          style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Roboto',
            color: FlutterFlowTheme.of(context).primaryBtnText,
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Filter"),
                  ),
                ];
              }, onSelected: (value) async {
            switch (value) {
              case 1:
               Map  da = await Get.toNamed(RoutesName.receiving_history_filter_view);
               //  // data = jsonDecode(da);
               //  // print(data['site_id'].toString());
               // // Map<String,String> d ={
               // //   'site_id':'51',
               // //   'floor_num':'1',
               // //   'stage_id':'2',
               // //   'daterange':'01-02-2023 To 08-02-2023'
               // // };
               receivingHistoryViewModel.receivedMaterialApi(da, context);
                break;
              case 2:
                break;
              default:
            }
          }),
        ],
        elevation: 0,
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: Get.height,
              child: ChangeNotifierProvider<ReceivingHistoryViewModel>(
                create: (context) => receivingHistoryViewModel,
                child: Consumer<ReceivingHistoryViewModel>(
                  builder: (context, value, _) {
                    // print(value.receivingHistoryList.status);
                    switch (value.receivingHistoryList.status) {
                      case Status.LOADING:
                        return const Center(child: CircularProgressIndicator());
                      case Status.ERROR:
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Center(
                              child: Text(value.receivingHistoryList.message.toString())),
                        );
                      case Status.COMPLETED:
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: value.receivingHistoryList.data!.result!.length,
                          itemBuilder: (context, index) {
                            var data = value.receivingHistoryList.data!.result![index];

                            return  Slidable(
                              endActionPane: ActionPane(


                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      Map<String,String> imgData = {
                                        'image':"${AppUrl.subMainUrl}/assets/material/uploads/${data.image}"
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
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.13,
                                margin: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                      width: 0.50,
                                    ),
                                  ),
                                ),
                                // decoration: BoxDecoration(
                                //   color: Colors.white,
                                //   borderRadius: BorderRadius.circular(0),
                                //   border: Border(
                                //     bottom: BorderSide(
                                //     color: FlutterFlowTheme.of(context).secondaryColor,)
                                //   ),
                                // ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: FlutterFlowTheme.of(context).tertiaryColor,
                                                  size: 20,
                                                ),
                                                Text(
                                                  data.siteName ?? "",
                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                            child: Text(
                                              data.matName ?? "",
                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                fontFamily: 'Poppins',
                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Stage:',
                                                    style:
                                                    FlutterFlowTheme.of(context).bodyText1.override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                    child: Text(
                                                      data.stageName ?? "",
                                                      style: FlutterFlowTheme.of(context).bodyText2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Floor :',
                                                    style:
                                                    FlutterFlowTheme.of(context).bodyText1.override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "${data.floorName}",
                                                          overflow: TextOverflow.ellipsis,
                                                        style: FlutterFlowTheme.of(context).bodyText2,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Ord. Qty.',
                                                    style:
                                                    FlutterFlowTheme.of(context).bodyText1.override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    data.orderQty ?? "",
                                                    style:
                                                    FlutterFlowTheme.of(context).bodyText2.override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Received Qty.',
                                                    style:
                                                    FlutterFlowTheme.of(context).bodyText1.override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                    child: Text(
                                                      "${data.receivedQty} ${data.matUnit}",
                                                      style:
                                                      FlutterFlowTheme.of(context).bodyText2.override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    ' Date: ',
                                                    style:
                                                    FlutterFlowTheme.of(context).bodyText1.override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                        const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                        child: Text(
                                                          DateFormat('dd MMM, yyyy').format( DateTime.parse(data.createDate ?? "")),
                                                          style: FlutterFlowTheme.of(context)
                                                              .bodyText2
                                                              .override(
                                                            fontFamily: 'Poppins',
                                                            fontSize: 12,
                                                          ),
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Received By:',
                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  data.createBy ?? "",
                                                  style: FlutterFlowTheme.of(context).bodyText2.override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                            child: Text(
                                              '[ Time:- ${DateFormat('h:mm a').format( DateTime.parse(data.createDate ?? ""))} ]',
                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },);

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
    );
  }
}
