import 'dart:developer';
import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/utils/utils.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_util.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_widgets.dart';
import 'package:civil_manager/view_model/material_view_model.dart';
import 'package:civil_manager/view_model/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RequestFormView extends StatefulWidget {
  final Map<String,String> data;
  const RequestFormView({Key? key,required this.data}) : super(key: key);

  @override
  State<RequestFormView> createState() => _RequestFormViewState();
}

class _RequestFormViewState extends State<RequestFormView> {
  MaterialViewModel materialViewModel = MaterialViewModel();
  final _formKey = GlobalKey<FormState>();

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
    materialViewModel.requestViewApi(data, context);
  }

  @override
  void dispose() {
    materialViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.data.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Request Form',
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
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                    FFButtonWidget(
                                      onPressed: () async {

                                        Map data1= <String,dynamic>{
                                          "user_id":user.read('user')['id'].toString(),
                                          "request_by":user.read('user')['user_name'].toString(),
                                          "required_id":materialViewModel.getAllId(),
                                          "request_qty":materialViewModel.getAllQty(),
                                        };

                                        dynamic  jsonData =jsonEncode(data1);

                                        // print(jsonData);

                                       await materialViewModel.requestSendApi(jsonData, context);
                                       // await Future.delayed(Duration(seconds: 2));
                                       //  materialViewModel.requestViewApi(data, context);
                                        materialViewModel.setClean();
                                      },

                                      text: 'Save',
                                      options: FFButtonOptions(
                                        width: 100,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
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
                          // print(value.requestViewList.status);
                          switch (value.requestViewList.status) {
                            case Status.LOADING:
                              return const Center(child: CircularProgressIndicator());
                            case Status.ERROR:
                              return SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Center(
                                    child: Text(value.requestViewList.message.toString())),
                              );
                            case Status.COMPLETED:
                              while (i < value.requestViewList.data!.result!.length) {
                                String id = value.requestViewList.data!.result![i].id.toString();
                                i++;
                                materialViewModel.setDefaultList(id);
                              }
                              return Form(
                                key: _formKey,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: value.requestViewList.data!.result!.length,
                                  itemBuilder: (context, index) {
                                    var data = value.requestViewList.data!.result![index];
                                    var needed = (int.parse(data.matQty.toString())  - int.parse(data.requestQty.toString())).toString();
                                    if(needed!="0")
                                      {
                                        return Column(
                                          children: [
                                            ExpansionTile(
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
                                                    child: TextFormField(
                                                      controller: materialViewModel.getLtc(index),
                                                      keyboardType:TextInputType.number ,
                                                      decoration: const InputDecoration(
                                                        contentPadding: EdgeInsets.only(left: 5),
                                                        border: OutlineInputBorder(),
                                                      ),
                                                      onChanged: (value) {
                                                        if(int.parse(value) > int.parse(data.matQty!) )
                                                        {
                                                          Utils.flushBarErrorMessage("${data.matName} Value is not valid ", context);
                                                          FocusScope.of(context).unfocus();
                                                          materialViewModel.setLtc(index,"");
                                                        }else
                                                        {
                                                          materialViewModel.setQty(index, value);
                                                        }
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                              childrenPadding: const EdgeInsets.symmetric(horizontal: 17.0,vertical: 8.0),
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    RichText(
                                                      text:  TextSpan(
                                                        style:  const TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.black,
                                                        ),
                                                        children: <TextSpan>[
                                                          const TextSpan(text: 'Order Qty: '),
                                                          TextSpan(text: data.orderQty.toString()=="null"?"0":data.orderQty.toString(), style:  const TextStyle(fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                    ),

                                                    RichText(
                                                      text:  TextSpan(
                                                        style:  const TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.black,
                                                        ),
                                                        children: <TextSpan>[
                                                          const TextSpan(text: 'Request Qty: '),
                                                          TextSpan(text: data.requestQty.toString()=="null"?"0":data.requestQty.toString(), style:  const TextStyle(fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                    ),
                                                    RichText(
                                                      text:  TextSpan(
                                                        style:  const TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.black,
                                                        ),
                                                        children: <TextSpan>[
                                                          const TextSpan(text: 'Needed: '),
                                                          TextSpan(text:needed, style:  const TextStyle(fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                    ),
                                                    // RichText(
                                                    //   text: TextSpan(
                                                    //   children:  <TextSpan>[
                                                    //     TextSpan("Order Qty: "+data.orderQty.toString()),
                                                    //     TextSpan("Request Qty: "+data.requestQty.toString())
                                                    //   ],)
                                                    // ),
                                                  ],
                                                )
                                              ],

                                            ),
                                            const Divider()
                                          ],
                                        );
                                      }
                                    else
                                      {
                                        return const SizedBox();
                                      }
                                  },

                                ),
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
