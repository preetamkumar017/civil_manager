import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_util.dart';
import 'package:civil_manager/view_model/material_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RequestedMaterialListView extends StatefulWidget {
  final Map<String,String> data;
  const RequestedMaterialListView({Key? key,required this.data}) : super(key: key);

  @override
  State<RequestedMaterialListView> createState() => _RequestedMaterialListViewState();
}

class _RequestedMaterialListViewState extends State<RequestedMaterialListView> {
  MaterialViewModel materialViewModel = MaterialViewModel();


  int i = 0;
  Map<String,String> data = {};



  @override
  void initState() {
    super.initState();
    data = {
      "site_id":widget.data['site_id'].toString(),
      "floor_num":widget.data['floor'].toString(),
      "stage_id":widget.data['stage'].toString(),
    };
    materialViewModel.requestedNewViewListApi(data);
  }

  @override
  void dispose() {
    materialViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Requested Material',
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
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width*0.90,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      // padding: EdgeInsets.only(left: 13.0),
                                      width: Get.width*0.45,
                                      child: Text(widget.data['site_name'].toString(),style: FlutterFlowTheme.of(context).subtitle1,
                                        overflow: TextOverflow.ellipsis ,),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 13.0),
                                      child: Text(DateFormat("dd MMM, yyyy").format(DateTime.now()),style: FlutterFlowTheme.of(context).subtitle1,),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Get.width*0.90,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text("Floor: ${widget.data['floor']} Floor",
                                        style: FlutterFlowTheme.of(context).subtitle2,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text("Stage Name: ${widget.data['stage_name']}",
                                        style: FlutterFlowTheme.of(context).subtitle2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: Get.width*0.20,
                            child: Text(
                              'Material',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryText,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: Get.width*0.25,
                            child: Text(
                              'Required ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryText,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width*0.25,
                            child: Text(
                              'Request',
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
                    child: ChangeNotifierProvider<MaterialViewModel>(
                      create: (context) => materialViewModel,
                      child: Consumer<MaterialViewModel>(
                        builder: (context, value, _) {
                          // print(value.requestedNewViewList.data!.toJson().toString());
                          switch (value.requestedNewViewList.status) {
                            case Status.LOADING:
                              return const Center(child: CircularProgressIndicator());
                            case Status.ERROR:
                              return SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Center(
                                    child: Text(value.requestViewList.message.toString())),
                              );
                            case Status.COMPLETED:

                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: value.requestedNewViewList.data!.result!.length,
                                itemBuilder: (context, index) {
                                  var data = value.requestedNewViewList.data!.result![index];
                                  // var needed = (int.parse(data.matQty.toString())  - int.parse(data.requestQty.toString())).toString();

                                    return ListTile(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            // alignment: Alignment.center,
                                              width: Get.width*0.20,
                                              child: Text(data.matName ?? "")),
                                          Container(
                                              alignment: Alignment.center,
                                              width: Get.width*0.25,
                                              child: Text("${data.matQty ?? ""} ${data.matUnit ?? ""}")),
                                          Container(
                                              alignment: Alignment.center,
                                              width: Get.width*0.25,
                                              child: Text("${data.requestQty ?? ""} ${data.matUnit ?? ""}")),

                                        ],
                                      ),
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
            // Visibility(
            //     visible: materialViewModel.getLoading,
            //     child: Container(color: FlutterFlowTheme.of(context).secondaryBackground,child: Center(child: CircularProgressIndicator()),))
          ],
        )
    );
  }
}
