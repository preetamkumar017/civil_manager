// import 'dart:developer';
//
// import 'package:civil_manager/data/response/status.dart';
// import 'package:civil_manager/res/components/text_style.dart';
// import 'package:civil_manager/utils/utils.dart';
// import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
// import 'package:civil_manager/view/flutter_flow/flutter_flow_util.dart';
// import 'package:civil_manager/view/flutter_flow/flutter_flow_widgets.dart';
// import 'package:civil_manager/view_model/material_view_model.dart';
// import 'package:civil_manager/view_model/services/storage.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
//
// import 'package:styled_divider/styled_divider.dart';
// import 'package:flutter/material.dart';
//
// class ReceivingMaterialView extends StatefulWidget {
//   final Map<String,String> data ;
//   const ReceivingMaterialView({Key? key , required this.data}) : super(key: key);
//
//   @override
//   ReceivingMaterialViewState createState() => ReceivingMaterialViewState();
// }
//
// class ReceivingMaterialViewState extends State<ReceivingMaterialView> {
//   final _unFocusNode = FocusNode();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   int i = 0;
//
//
//   MaterialViewModel materialViewModel = MaterialViewModel();
//
//
//   @override
//   void initState() {
//     log(widget.data.toString());
//     materialViewModel.requestedViewListApi(widget.data);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _unFocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       key: scaffoldKey,
//       backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
//       appBar: AppBar(
//         title: Text(
//           'Request Material',
//           style: FlutterFlowTheme.of(context).bodyText1.override(
//             fontFamily: 'Roboto',
//             color:
//             FlutterFlowTheme.of(context).primaryBtnText,
//             fontSize: 25,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//         backgroundColor:  FlutterFlowTheme.of(context).tertiaryColor,
//         elevation: 0.0,
//       ),
//       body: Stack(
//         children: [
//           SafeArea(
//           child: GestureDetector(
//             onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: FlutterFlowTheme.of(context).tertiaryColor,
//                 shape: BoxShape.rectangle,
//               ),
//               child: Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 1,
//                   decoration: BoxDecoration(
//                     color: FlutterFlowTheme.of(context).primaryBtnText,
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(0),
//                       bottomRight: Radius.circular(0),
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                     shape: BoxShape.rectangle,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
//                     child: Column(
//                       children: [
//
//                         Expanded(
//                           child: SizedBox(
//                             height: Get.height,
//                             child: ChangeNotifierProvider<MaterialViewModel>(
//                               create: (context) => materialViewModel,
//                               child: Consumer<MaterialViewModel>(
//                                 builder: (context, value, _) {
//                                   // print(value.requestedViewList.status);
//                                   switch (value.requestedViewList.status) {
//                                     case Status.LOADING:
//                                       return const Center(child: CircularProgressIndicator());
//                                     case Status.ERROR:
//                                       return SingleChildScrollView(
//                                         physics: const BouncingScrollPhysics(),
//                                         child: Center(
//                                             child: Text(value.requestedViewList.message.toString())),
//                                       );
//                                     case Status.COMPLETED:
//                                       while (i < value.requestedViewList.data!.result!.length) {
//                                         String id = value.requestedViewList.data!.result![i].id.toString();
//                                         i++;
//                                         materialViewModel.setDefaultList(id);
//                                       }
//
//                                       return ListView.builder(
//                                         physics: const BouncingScrollPhysics(),
//                                         shrinkWrap: true,
//                                         itemCount: value.requestedViewList.data!.result!.length,
//                                         itemBuilder: (context, index) {
//                                           var data = value.requestedViewList.data!.result![index];
//                                           var initVal =  (int.parse(data.orderQty ?? "")-int.parse(data.receivedQty ?? "0")).toString();
//                                           // materialViewModel.setLtc(index,initVal);
//                                           return  Card(
//                                             margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
//                                             color: Colors.transparent,
//                                             elevation: 3,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.circular(20),
//                                             ),
//                                             child: Form(
//                                               // key: _formKey,
//                                               child: Container(
//                                                 width: MediaQuery.of(context).size.width * 0.9,
//                                                 height: 180,
//                                                 alignment: Alignment.center,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius: BorderRadius.circular(20),
//                                                   border: Border.all(
//                                                     color: FlutterFlowTheme.of(context)
//                                                         .secondaryColor,
//                                                   ),
//                                                 ),
//                                                 child: Padding(
//                                                   padding:
//                                                   const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
//                                                   child: Column(
//                                                     mainAxisSize: MainAxisSize.max,
//                                                     children: [
//                                                       Row(
//                                                         mainAxisSize: MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                         MainAxisAlignment.spaceBetween,
//                                                         children: [
//                                                           Padding(
//                                                             padding:
//                                                             const EdgeInsetsDirectional.fromSTEB(
//                                                                 15, 0, 0, 0),
//                                                             child: Row(
//                                                               mainAxisSize: MainAxisSize.max,
//                                                               children: [
//                                                                 Image.asset(
//                                                                   'assets/images/reqicon.png',
//                                                                   width: 25,
//                                                                   height: 25,
//                                                                   fit: BoxFit.cover,
//                                                                 ),
//                                                                 Padding(
//                                                                   padding: const EdgeInsetsDirectional
//                                                                       .fromSTEB(5, 0, 0, 0),
//                                                                   child: Text('${addOrdinalSuffix(int.parse(data.floorNum ?? ""))} Floor',
//                                                                     style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                         .bodyText2,
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           Padding(
//                                                             padding:
//                                                             const EdgeInsetsDirectional.fromSTEB(
//                                                                 0, 0, 15, 0),
//                                                             child: Row(
//                                                               mainAxisSize: MainAxisSize.max,
//                                                               children: [
//                                                                 Text(
//                                                                   'Stage:',
//                                                                   style:
//                                                                   FlutterFlowTheme.of(context)
//                                                                       .bodyText1,
//                                                                 ),
//                                                                 Text(
//                                                                   data.stageName ?? "",
//                                                                   style:
//                                                                   FlutterFlowTheme.of(context)
//                                                                       .bodyText2,
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       StyledDivider(
//                                                         thickness: 0.25,
//                                                         color: FlutterFlowTheme.of(context)
//                                                             .secondaryBackground,
//                                                         lineStyle: DividerLineStyle.solid,
//                                                       ),
//                                                       Row(
//                                                         mainAxisSize: MainAxisSize.max,
//
//                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                         children: [
//                                                           Padding(
//                                                             padding:
//                                                             const EdgeInsetsDirectional.fromSTEB(
//                                                                 15, 0, 0, 0),
//                                                             child: Row(
//                                                               mainAxisSize: MainAxisSize.max,
//                                                               children: [
//                                                                 Padding(
//                                                                   padding: const EdgeInsetsDirectional
//                                                                       .fromSTEB(5, 0, 0, 0),
//                                                                   child: Text(
//                                                                     data.matName ?? "",
//                                                                     style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                         .bodyText1
//                                                                         .override(
//                                                                       fontFamily: 'Poppins',
//                                                                       color: FlutterFlowTheme
//                                                                           .of(context)
//                                                                           .primaryBackground,
//                                                                       fontSize: 16,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           Padding(
//                                                             padding:
//                                                             const EdgeInsetsDirectional.fromSTEB(
//                                                                 0, 0, 15, 0),
//                                                             child: Row(
//                                                               mainAxisSize: MainAxisSize.max,
//                                                               children: [
//                                                                 Padding(
//                                                                   padding: const EdgeInsetsDirectional
//                                                                       .fromSTEB(0, 0, 5, 0),
//                                                                   child: Text(
//                                                                     'Required Qty:',
//                                                                     style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                         .bodyText1
//                                                                         .override(
//                                                                       fontFamily: 'Poppins',
//                                                                       fontSize: 12,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Text(
//                                                                   data.requiredQty ?? "",
//                                                                   style:
//                                                                   FlutterFlowTheme.of(context)
//                                                                       .bodyText2
//                                                                       .override(
//                                                                     fontFamily: 'Poppins',
//                                                                     fontSize: 12,
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       Padding(
//                                                         padding: const EdgeInsetsDirectional.fromSTEB(
//                                                             0, 5, 0, 0),
//                                                         child: Row(
//                                                           mainAxisSize: MainAxisSize.max,
//                                                           mainAxisAlignment:
//                                                           MainAxisAlignment.spaceBetween,
//                                                           children: [
//                                                             Padding(
//                                                               padding:
//                                                               const EdgeInsetsDirectional.fromSTEB(
//                                                                   15, 0, 0, 0),
//                                                               child: Row(
//                                                                 mainAxisSize: MainAxisSize.max,
//                                                                 children: [
//                                                                   Padding(
//                                                                     padding: const EdgeInsetsDirectional
//                                                                         .fromSTEB(5, 0, 0, 0),
//                                                                     child: Text(
//                                                                       'Ordered Qty:',
//                                                                       style: FlutterFlowTheme.of(
//                                                                           context)
//                                                                           .bodyText1
//                                                                           .override(
//                                                                         fontFamily: 'Poppins',
//                                                                         fontSize: 12,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                   Padding(
//                                                                     padding: const EdgeInsetsDirectional
//                                                                         .fromSTEB(2, 0, 0, 0),
//                                                                     child: Text(
//                                                                       data.orderQty ?? "",
//                                                                       style: FlutterFlowTheme.of(context)
//                                                                           .bodyText2
//                                                                           .override(
//                                                                         fontFamily: 'Poppins',
//                                                                         fontSize: 12,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                             Padding(
//                                                               padding:
//                                                               const EdgeInsetsDirectional.fromSTEB( 0, 0, 15, 0),
//                                                               child: Row(
//                                                                 mainAxisSize: MainAxisSize.max,
//                                                                 children: [
//                                                                   Text(
//                                                                     'Previous Rec:',
//                                                                     style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                         .bodyText1
//                                                                         .override(
//                                                                       fontFamily: 'Poppins',
//                                                                       fontSize: 12,
//                                                                     ),
//                                                                   ),
//                                                                   Padding(
//                                                                     padding: const EdgeInsetsDirectional
//                                                                         .fromSTEB(2, 0, 0, 0),
//                                                                     child: Text(
//                                                                       data.receivedQty ?? "",
//                                                                       style: FlutterFlowTheme.of(
//                                                                           context)
//                                                                           .bodyText2
//                                                                           .override(
//                                                                         fontFamily: 'Poppins',
//                                                                         fontSize: 12,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding: const EdgeInsetsDirectional.fromSTEB(
//                                                             0, 5, 0, 0),
//                                                         child: Row(
//                                                           mainAxisSize: MainAxisSize.max,
//                                                           mainAxisAlignment:
//                                                           MainAxisAlignment.spaceBetween,
//                                                           children: [
//                                                             Padding(
//                                                               padding:
//                                                               const EdgeInsetsDirectional.fromSTEB(
//                                                                   15, 0, 0, 0),
//                                                               child: Row(
//                                                                 mainAxisSize: MainAxisSize.max,
//                                                                 children: [
//                                                                   Padding(
//                                                                     padding: const EdgeInsetsDirectional
//                                                                         .fromSTEB(5, 0, 0, 0),
//                                                                     child: Text(
//                                                                       'Requested Qty:',
//                                                                       style: FlutterFlowTheme.of(
//                                                                           context)
//                                                                           .bodyText1
//                                                                           .override(
//                                                                         fontFamily: 'Poppins',
//                                                                         fontSize: 12,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                   Padding(
//                                                                     padding: const EdgeInsetsDirectional
//                                                                         .fromSTEB(2, 0, 0, 0),
//                                                                     child: Text(
//                                                                       data.requestQty ?? "",
//                                                                       style: FlutterFlowTheme.of(context)
//                                                                           .bodyText2
//                                                                           .override(
//                                                                         fontFamily: 'Poppins',
//                                                                         fontSize: 12,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                             Padding(
//                                                               padding:
//                                                               const EdgeInsetsDirectional.fromSTEB( 0, 0, 15, 0),
//                                                               child: Row(
//                                                                 mainAxisSize: MainAxisSize.max,
//                                                                 children: [
//                                                                   Text(
//                                                                     "Pending Rec ",
//                                                                     style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                         .bodyText1
//                                                                         .override(
//                                                                       fontFamily: 'Poppins',
//                                                                       fontSize: 12,
//                                                                     ),
//                                                                   ),
//                                                                   Padding(
//                                                                     padding: const EdgeInsetsDirectional
//                                                                         .fromSTEB(2, 0, 0, 0),
//                                                                     child: Text(
//                                                                       initVal,
//                                                                       style: FlutterFlowTheme.of(
//                                                                           context)
//                                                                           .bodyText2
//                                                                           .override(
//                                                                         fontFamily: 'Poppins',
//                                                                         fontSize: 12,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding: const EdgeInsetsDirectional.fromSTEB(
//                                                             0, 5, 0, 0),
//                                                         child: Row(
//                                                           mainAxisSize: MainAxisSize.max,
//                                                           mainAxisAlignment:
//                                                           MainAxisAlignment.spaceBetween,
//                                                           children: [
//                                                             Padding(
//                                                               padding:
//                                                               const EdgeInsetsDirectional.fromSTEB(
//                                                                   15, 0, 0, 0),
//                                                               child: Row(
//                                                                 mainAxisSize: MainAxisSize.max,
//                                                                 children: [
//                                                                   Padding(
//                                                                     padding: const EdgeInsetsDirectional
//                                                                         .fromSTEB(5, 0, 0, 0),
//                                                                     child: Text(
//                                                                       'Received Qty:',
//                                                                       style: FlutterFlowTheme.of(
//                                                                           context)
//                                                                           .bodyText1
//                                                                           .override(
//                                                                         fontFamily: 'Poppins',
//                                                                         fontSize: 12,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                   Padding(
//                                                                     padding: const EdgeInsetsDirectional
//                                                                         .fromSTEB(5, 0, 0, 0),
//                                                                     child: Container(
//                                                                       width: MediaQuery.of(context)
//                                                                           .size
//                                                                           .width *
//                                                                           0.35,
//                                                                       height: MediaQuery.of(context)
//                                                                           .size
//                                                                           .height*
//                                                                           0.04,
//                                                                       decoration: BoxDecoration(
//                                                                         color:
//                                                                         FlutterFlowTheme.of(
//                                                                             context)
//                                                                             .primaryBtnText,
//                                                                         borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             5),
//                                                                         border: Border.all(
//                                                                           color:
//                                                                           FlutterFlowTheme.of(
//                                                                               context)
//                                                                               .secondaryColor,
//                                                                         ),
//                                                                       ),
//                                                                       child: TextFormField(
//                                                                         controller: materialViewModel.getLtc(index),
//                                                                         keyboardType: TextInputType.number,
//                                                                         // initialValue: initVal,
//
//                                                                         decoration: const InputDecoration(
//                                                                           border: InputBorder.none,
//                                                                           // hintText: "Pending Rec "+initVal,
//                                                                         ),
//
//                                                                         // onChanged: (value) {
//                                                                         //   if(value.trim()!=""){
//                                                                         //     if (int.parse(value) >
//                                                                         //         int.parse(initVal)) {
//                                                                         //       Utils.flushBarErrorMessage(data.matName.toString() + " Value is not valid ",
//                                                                         //           context);
//                                                                         //       FocusScope.of(context).unfocus();
//                                                                         //       materialViewModel.setLtc(index,"");
//                                                                         //     }
//                                                                         //   }
//                                                                         // },
//
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                             Row(
//                                                               mainAxisSize: MainAxisSize.max,
//                                                               children: [
//                                                                 Padding(
//                                                                   padding: const EdgeInsetsDirectional
//                                                                       .fromSTEB(0, 0, 15, 0),
//                                                                   child:FFButtonWidget(
//                                                                     onPressed: () async {
//                                                                         if(materialViewModel.getLtcText(index).trim()=="")
//                                                                         {
//                                                                           Utils.flushBarErrorMessage("Please first Insert QTY", context);
//                                                                         }
//                                                                         else
//                                                                         {
//
//
//                                                                         Map data1= <String,dynamic>{
//                                                                           "required_id":data.requiredId,
//                                                                           "request_id":data.requestId,
//                                                                           "order_id":data.id,
//                                                                           "order_qty":data.orderQty,
//                                                                           "received_qty":data.receivedQty,
//                                                                           "new_received_qty":materialViewModel.getLtcText(index),
//                                                                           "created_by":user.read('user')['user_name'].toString(),
//                                                                         };
//
//                                                                       dynamic  jsonData =jsonEncode(data1);
//
//                                                                       // print(jsonData);
//                                                                     await  materialViewModel.receivedMaterialApi(jsonData,widget.data, context);
//
//                                                                         // materialViewModel.requestedViewListApi(widget.data);
//                                                                         materialViewModel.setLtc(index,"");
//
//                                                                         setState((){});
//
//
//                                                                       }
//
//
//
//                                                                     },
//                                                                     text: 'Save',
//                                                                     options: FFButtonOptions(
//                                                                       width: 70,
//                                                                       height: 25,
//                                                                       color: FlutterFlowTheme.of(
//                                                                           context)
//                                                                           .tertiaryColor,
//                                                                       textStyle: FlutterFlowTheme
//                                                                           .of(context)
//                                                                           .subtitle2
//                                                                           .override(
//                                                                         fontFamily: 'Poppins',
//                                                                         color: Colors.white,
//                                                                         fontSize: 14,
//                                                                         fontWeight:
//                                                                         FontWeight.normal,
//                                                                       ),
//                                                                       borderSide: const BorderSide(
//                                                                         color: Colors.transparent,
//                                                                         width: 1,
//                                                                       ),
//                                                                       borderRadius:
//                                                                       BorderRadius.circular(
//                                                                           5),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },);
//
//                                     default:
//                                       break;
//                                   }
//                                   return Container();
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//           // Visibility(
//           //     visible: materialViewModel.getLoading,
//           //     child: Container(color: FlutterFlowTheme.of(context).secondaryBackground,child: Center(child: CircularProgressIndicator()),))
//           //
//         ],
//       ),
//     );
//   }
// }
