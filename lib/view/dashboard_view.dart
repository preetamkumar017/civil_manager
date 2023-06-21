
import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/res/components/drawer.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view_model/dashboard_view_model.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  DashboardViewState createState() => DashboardViewState();
}

class DashboardViewState extends State<DashboardView> {
  final _unFocusNode = FocusNode();

  final DashboardViewModel _dashboardViewModel = DashboardViewModel();

  @override
  void initState() {
    super.initState();
    _dashboardViewModel.fetchDashboardListApi();
  }
  @override
  void dispose() {
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:  Text(
            'Dashboard',
            style: FlutterFlowTheme.of(context)
                .bodyText1
                .override(
              fontFamily: 'Poppins',
              fontSize: 25,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        drawer: const MyDrawer(),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
            child: RefreshIndicator(
              onRefresh: () =>
                  _dashboardViewModel.fetchDashboardListApi(),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.max,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Container(
                        //
                        //           margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                        //           child: IconButton(onPressed: (){
                        //           },icon: Icon(Icons.menu),)),
                        //       Container(
                        //         margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
                        //
                        //         child: Row(
                        //           mainAxisSize: MainAxisSize.max,
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //               'Dashboard',
                        //               style: FlutterFlowTheme.of(context)
                        //                   .bodyText1
                        //                   .override(
                        //                 fontFamily: 'Poppins',
                        //                 fontSize: 25,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        // Padding(
                        //   padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        //   child: Text(
                        //     'Labour Management Dashboard',
                        //     textAlign: TextAlign.center,
                        //     style: FlutterFlowTheme.of(context).bodyText1.override(
                        //           fontFamily: 'Poppins',
                        //           color: FlutterFlowTheme.of(context).primaryColor,
                        //           fontSize: 16,
                        //         ),
                        //   ),
                        // ),

                        ChangeNotifierProvider<DashboardViewModel>(
                          create: (context) => _dashboardViewModel,
                          child: Consumer<DashboardViewModel>(
                            builder: (context, value, _) {

                              switch (value.dashboardList.status) {
                                case Status.LOADING:
                                  return const Center(child: CircularProgressIndicator());
                                case Status.ERROR:
                                  return Center(
                                      child: Text(value.dashboardList.message.toString()));
                                case Status.COMPLETED:
                                // print(value.toString());
                                  var data = value.dashboardList.data!.result;
                                  // print(data!.labour);
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 160,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF7C41F3),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                                        0, 10, 0, 0),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        const Icon(
                                                          Icons.person,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              'Total Labour',
                                                              style: FlutterFlowTheme.of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  data!.labour ?? "",
                                                                  style: FlutterFlowTheme.of(context)
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily: 'Poppins',
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                              child: Container(
                                                width: 160,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFF5C525),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                          0, 10, 0, 0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          const Icon(
                                                            Icons.currency_rupee,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                'Total Payable',
                                                                style: FlutterFlowTheme.of(context)
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: Colors.white,
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    'Rs.${data.weeklyPayable}',
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily: 'Poppins',
                                                                      color: Colors.white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
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
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 160,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFF9062),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                                        0, 10, 0, 0),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        const Icon(
                                                          Icons.place,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              'Total Site',
                                                              style: FlutterFlowTheme.of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily: 'Poppins',
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  data.site ?? "",
                                                                  style: FlutterFlowTheme.of(context)
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily: 'Poppins',
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                              child: Container(
                                                width: 160,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF3BCAE8),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                          0, 10, 0, 0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          const Icon(
                                                            Icons.person,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                'Total Head',
                                                                style: FlutterFlowTheme.of(context)
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: Colors.white,
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    data.labourHead ?? "",
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily: 'Poppins',
                                                                      color: Colors.white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
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
                                  );
                                default:
                                  break;
                              }

                              return Container();
                            },
                          ),
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Padding(
                        //       padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        //       child: Row(
                        //         mainAxisSize: MainAxisSize.max,
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Container(
                        //             width: 160,
                        //             height: 60,
                        //             decoration: BoxDecoration(
                        //               color: const Color(0xFF7C41F3),
                        //               borderRadius: BorderRadius.circular(20),
                        //             ),
                        //             child: Column(
                        //               mainAxisSize: MainAxisSize.max,
                        //               children: [
                        //                 Padding(
                        //                   padding: const EdgeInsetsDirectional.fromSTEB(
                        //                       0, 10, 0, 0),
                        //                   child: Row(
                        //                     mainAxisSize: MainAxisSize.max,
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.spaceEvenly,
                        //                     children: [
                        //                       const Icon(
                        //                         Icons.person,
                        //                         color: Colors.white,
                        //                         size: 30,
                        //                       ),
                        //                       Column(
                        //                         children: [
                        //                           Text(
                        //                             'Total Labour',
                        //                             style: FlutterFlowTheme.of(context)
                        //                                 .bodyText1
                        //                                 .override(
                        //                                   fontFamily: 'Poppins',
                        //                                   color: Colors.white,
                        //                                 ),
                        //                           ),
                        //                           Row(
                        //                             mainAxisSize: MainAxisSize.max,
                        //                             mainAxisAlignment: MainAxisAlignment.center,
                        //                             children: [
                        //                               Text(
                        //                                 '162',
                        //                                 style: FlutterFlowTheme.of(context)
                        //                                     .bodyText1
                        //                                     .override(
                        //                                   fontFamily: 'Poppins',
                        //                                   color: Colors.white,
                        //                                 ),
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //           Padding(
                        //             padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        //             child: Container(
                        //               width: 160,
                        //               height: 60,
                        //               decoration: BoxDecoration(
                        //                 color: const Color(0xFFF5C525),
                        //                 borderRadius: BorderRadius.circular(20),
                        //               ),
                        //               child: Column(
                        //                 mainAxisSize: MainAxisSize.max,
                        //                 children: [
                        //                   Padding(
                        //                     padding: const EdgeInsetsDirectional.fromSTEB(
                        //                         0, 10, 0, 0),
                        //                     child: Row(
                        //                       mainAxisSize: MainAxisSize.max,
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.spaceEvenly,
                        //                       children: [
                        //                         const Icon(
                        //                           Icons.currency_rupee,
                        //                           color: Colors.white,
                        //                           size: 30,
                        //                         ),
                        //                         Column(
                        //                           children: [
                        //                             Text(
                        //                               'Total Payable',
                        //                               style: FlutterFlowTheme.of(context)
                        //                                   .bodyText1
                        //                                   .override(
                        //                                     fontFamily: 'Poppins',
                        //                                     color: Colors.white,
                        //                                   ),
                        //                             ),
                        //                             Row(
                        //                               mainAxisSize: MainAxisSize.max,
                        //                               mainAxisAlignment: MainAxisAlignment.center,
                        //                               children: [
                        //                                 Text(
                        //                                   'Rs.30,000',
                        //                                   style: FlutterFlowTheme.of(context)
                        //                                       .bodyText1
                        //                                       .override(
                        //                                     fontFamily: 'Poppins',
                        //                                     color: Colors.white,
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Padding(
                        //       padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        //       child: Row(
                        //         mainAxisSize: MainAxisSize.max,
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Container(
                        //             width: 160,
                        //             height: 60,
                        //             decoration: BoxDecoration(
                        //               color: const Color(0xFFFF9062),
                        //               borderRadius: BorderRadius.circular(20),
                        //             ),
                        //             child: Column(
                        //               mainAxisSize: MainAxisSize.max,
                        //               children: [
                        //                 Padding(
                        //                   padding: const EdgeInsetsDirectional.fromSTEB(
                        //                       0, 10, 0, 0),
                        //                   child: Row(
                        //                     mainAxisSize: MainAxisSize.max,
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.spaceEvenly,
                        //                     children: [
                        //                       const Icon(
                        //                         Icons.place,
                        //                         color: Colors.white,
                        //                         size: 30,
                        //                       ),
                        //                       Column(
                        //                         children: [
                        //                           Text(
                        //                             'Total Site',
                        //                             style: FlutterFlowTheme.of(context)
                        //                                 .bodyText1
                        //                                 .override(
                        //                                   fontFamily: 'Poppins',
                        //                                   color: Colors.white,
                        //                                 ),
                        //                           ),
                        //                           Row(
                        //                             mainAxisSize: MainAxisSize.max,
                        //                             mainAxisAlignment: MainAxisAlignment.center,
                        //                             children: [
                        //                               Text(
                        //                                 '33',
                        //                                 style: FlutterFlowTheme.of(context)
                        //                                     .bodyText1
                        //                                     .override(
                        //                                   fontFamily: 'Poppins',
                        //                                   color: Colors.white,
                        //                                 ),
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //           Padding(
                        //             padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        //             child: Container(
                        //               width: 160,
                        //               height: 60,
                        //               decoration: BoxDecoration(
                        //                 color: const Color(0xFF3BCAE8),
                        //                 borderRadius: BorderRadius.circular(20),
                        //               ),
                        //               child: Column(
                        //                 mainAxisSize: MainAxisSize.max,
                        //                 children: [
                        //                   Padding(
                        //                     padding: const EdgeInsetsDirectional.fromSTEB(
                        //                         0, 10, 0, 0),
                        //                     child: Row(
                        //                       mainAxisSize: MainAxisSize.max,
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.spaceEvenly,
                        //                       children: [
                        //                         const Icon(
                        //                           Icons.person,
                        //                           color: Colors.white,
                        //                           size: 30,
                        //                         ),
                        //                         Column(
                        //                           children: [
                        //                             Text(
                        //                               'Total Head',
                        //                               style: FlutterFlowTheme.of(context)
                        //                                   .bodyText1
                        //                                   .override(
                        //                                     fontFamily: 'Poppins',
                        //                                     color: Colors.white,
                        //                                   ),
                        //                             ),
                        //                             Row(
                        //                               mainAxisSize: MainAxisSize.max,
                        //                               mainAxisAlignment: MainAxisAlignment.center,
                        //                               children: [
                        //                                 Text(
                        //                                   '9',
                        //                                   style: FlutterFlowTheme.of(context)
                        //                                       .bodyText1
                        //                                       .override(
                        //                                     fontFamily: 'Poppins',
                        //                                     color: Colors.white,
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        //
                        // Column(
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        //       child: Row(
                        //         mainAxisSize: MainAxisSize.max,
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Container(
                        //             width: MediaQuery.of(context).size.width * 0.3,
                        //             height: MediaQuery.of(context).size.height * 0.05,
                        //             decoration: BoxDecoration(
                        //               color: FlutterFlowTheme.of(context).secondaryColor,
                        //               borderRadius: BorderRadius.circular(15),
                        //             ),
                        //             child: Row(
                        //               mainAxisSize: MainAxisSize.max,
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: [
                        //                 Text(
                        //                   'Check List',
                        //                   style: FlutterFlowTheme.of(context).bodyText1.override(
                        //                     fontFamily: 'Poppins',
                        //                     color: FlutterFlowTheme.of(context).primaryColor,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Padding(
                        //       padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        //       child: Row(
                        //         mainAxisSize: MainAxisSize.max,
                        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //         children: [
                        //           Column(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               Row(
                        //                 mainAxisSize: MainAxisSize.max,
                        //                 children: [
                        //                   Material(
                        //                     color: Colors.transparent,
                        //                     elevation: 1,
                        //                     shape: RoundedRectangleBorder(
                        //                       borderRadius: BorderRadius.circular(20),
                        //                     ),
                        //                     child: Container(
                        //                       width: 150,
                        //                       height: 85,
                        //                       decoration: BoxDecoration(
                        //                         color: Colors.white,
                        //                         borderRadius: BorderRadius.circular(20),
                        //                         border: Border.all(
                        //                           color: FlutterFlowTheme.of(context).secondaryColor,
                        //                         ),
                        //                       ),
                        //                       child: Column(
                        //                         mainAxisSize: MainAxisSize.max,
                        //                         children: [
                        //                           Padding(
                        //                             padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        //                             child: Row(
                        //                               mainAxisSize: MainAxisSize.max,
                        //                               mainAxisAlignment: MainAxisAlignment.center,
                        //                               children: [
                        //                                 Image.asset(
                        //                                   'assets/images/role.png',
                        //                                   width: 30,
                        //                                   height: 30,
                        //                                   fit: BoxFit.cover,
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ),
                        //                           Padding(
                        //                             padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        //                             child: Row(
                        //                               mainAxisSize: MainAxisSize.max,
                        //                               mainAxisAlignment: MainAxisAlignment.center,
                        //                               children: [
                        //                                 Text(
                        //                                   'Duties',
                        //                                   style: FlutterFlowTheme.of(context)
                        //                                       .bodyText1
                        //                                       .override(
                        //                                     fontFamily: 'Poppins',
                        //                                     color: FlutterFlowTheme.of(context)
                        //                                         .secondaryText,
                        //                                     fontSize: 13,
                        //                                     fontWeight: FontWeight.w600,
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //           Material(
                        //             color: Colors.transparent,
                        //             elevation: 1,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20),
                        //             ),
                        //             child: Container(
                        //               width: 150,
                        //               height: 85,
                        //               decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(20),
                        //                 border: Border.all(
                        //                   color: FlutterFlowTheme.of(context).secondaryColor,
                        //                 ),
                        //               ),
                        //               child: Column(
                        //                 mainAxisSize: MainAxisSize.max,
                        //                 children: [
                        //                   Padding(
                        //                     padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        //                     child: Row(
                        //                       mainAxisSize: MainAxisSize.max,
                        //                       mainAxisAlignment: MainAxisAlignment.center,
                        //                       children: [
                        //                         Image.asset(
                        //                           'assets/images/concrete-mixer.png',
                        //                           width: 30,
                        //                           height: 30,
                        //                           fit: BoxFit.cover,
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                   Padding(
                        //                     padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        //                     child: Row(
                        //                       mainAxisSize: MainAxisSize.max,
                        //                       mainAxisAlignment: MainAxisAlignment.center,
                        //                       children: [
                        //                         Text(
                        //                           'Slab Check List',
                        //                           textAlign: TextAlign.center,
                        //                           style: FlutterFlowTheme.of(context).bodyText1.override(
                        //                             fontFamily: 'Poppins',
                        //                             color: FlutterFlowTheme.of(context).secondaryText,
                        //                             fontSize: 13,
                        //                             fontWeight: FontWeight.w600,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Padding(
                        //       padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        //       child: Row(
                        //         mainAxisSize: MainAxisSize.max,
                        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //         children: [
                        //           Column(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               Row(
                        //                 mainAxisSize: MainAxisSize.max,
                        //                 children: [
                        //                   Material(
                        //                     color: Colors.transparent,
                        //                     elevation: 1,
                        //                     shape: RoundedRectangleBorder(
                        //                       borderRadius: BorderRadius.circular(20),
                        //                     ),
                        //                     child: Container(
                        //                       width: 150,
                        //                       height: 85,
                        //                       decoration: BoxDecoration(
                        //                         color: Colors.white,
                        //                         borderRadius: BorderRadius.circular(20),
                        //                         border: Border.all(
                        //                           color: FlutterFlowTheme.of(context).secondaryColor,
                        //                         ),
                        //                       ),
                        //                       child: Column(
                        //                         mainAxisSize: MainAxisSize.max,
                        //                         children: [
                        //                           Padding(
                        //                             padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        //                             child: Row(
                        //                               mainAxisSize: MainAxisSize.max,
                        //                               mainAxisAlignment: MainAxisAlignment.center,
                        //                               children: [
                        //                                 Image.asset(
                        //                                   'assets/images/foundation.png',
                        //                                   width: 30,
                        //                                   height: 30,
                        //                                   fit: BoxFit.cover,
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ),
                        //                           Padding(
                        //                             padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        //                             child: Row(
                        //                               mainAxisSize: MainAxisSize.max,
                        //                               mainAxisAlignment: MainAxisAlignment.center,
                        //                               children: [
                        //                                 Text(
                        //                                   'Footing',
                        //                                   style: FlutterFlowTheme.of(context)
                        //                                       .bodyText1
                        //                                       .override(
                        //                                     fontFamily: 'Poppins',
                        //                                     color: FlutterFlowTheme.of(context)
                        //                                         .secondaryText,
                        //                                     fontSize: 13,
                        //                                     fontWeight: FontWeight.w600,
                        //                                   ),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           ),
                        //           Material(
                        //             color: Colors.transparent,
                        //             elevation: 1,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20),
                        //             ),
                        //             child: Container(
                        //               width: 150,
                        //               height: 85,
                        //               decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(20),
                        //                 border: Border.all(
                        //                   color: FlutterFlowTheme.of(context).secondaryColor,
                        //                 ),
                        //               ),
                        //               child: Column(
                        //                 mainAxisSize: MainAxisSize.max,
                        //                 children: [
                        //                   Padding(
                        //                     padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        //                     child: Row(
                        //                       mainAxisSize: MainAxisSize.max,
                        //                       mainAxisAlignment: MainAxisAlignment.center,
                        //                       children: [
                        //                         Image.asset(
                        //                           'assets/images/tools.png',
                        //                           width: 30,
                        //                           height: 30,
                        //                           fit: BoxFit.cover,
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                   Padding(
                        //                     padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        //                     child: Row(
                        //                       mainAxisSize: MainAxisSize.max,
                        //                       mainAxisAlignment: MainAxisAlignment.center,
                        //                       children: [
                        //                         Text(
                        //                           'Plinth',
                        //                           textAlign: TextAlign.center,
                        //                           style: FlutterFlowTheme.of(context).bodyText1.override(
                        //                             fontFamily: 'Poppins',
                        //                             color: FlutterFlowTheme.of(context).secondaryText,
                        //                             fontSize: 13,
                        //                             fontWeight: FontWeight.w600,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     )
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 35,
                                              height: 35,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/Group_10.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                              child: Text(
                                                'Quick Links',
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 2,
                                        indent: 25,
                                        endIndent: 25,
                                        color:  Color(0xFFB2EBF2),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            // log("clicked");
                                            Get.toNamed(RoutesName.add_labour_view);
                                          },
                                          title: Text(
                                            'Manage Labour',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            // log("clicked");
                                            Get.toNamed(RoutesName.labour_list_view);
                                          },
                                          title: Text(
                                            'Labour List',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            // log("clicked");
                                            Get.toNamed(RoutesName.labour_attendance_screen1_view);
                                          },
                                          title: Text(
                                            'Labour Attendance',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            // log("clicked");
                                            Get.toNamed(RoutesName.labour_show_attendance_screen1_view);
                                          },
                                          title: Text(
                                            'Attendance List',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            // log("clicked");
                                            Get.toNamed(RoutesName.labour_payment_filter_view);
                                          },
                                          title: Text(
                                            'Labour Payment',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
/**************************end Quick Link*******************************************************/
/**************************Start Requirement*******************************************************/
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 35,
                                              height: 35,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/Group_10.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                              child: Text(
                                                'Requirement',
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 2,
                                        indent: 25,
                                        endIndent: 25,
                                        color:  Color(0xFFB2EBF2),
                                      ),

                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            Get.toNamed(RoutesName.stock_select_site_view);
                                          },
                                          title: Text(
                                            'Stock View',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),

                                      const Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            // log("clicked");
                                            Get.toNamed(RoutesName.request_select_site_view);
                                          },
                                          title: Text(
                                            'Required Material',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            Get.toNamed(RoutesName.requested_material_list_site_view);
                                          },
                                          title: Text(
                                            'Requested Material List',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            Get.toNamed(RoutesName.receiving_material_select_site_view);
                                          },
                                          title: Text(
                                            'Receiving Material',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            Get.toNamed(RoutesName.receiving_history_view);
                                          },
                                          title: Text(
                                            'Receiving History',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
 /**************************End Requirement*******************************************************/
/**************************Start Client Portal*******************************************************/
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 35,
                                              height: 35,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/Group_10.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                              child: Text(
                                                'Client Portal',
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 2,
                                        indent: 25,
                                        endIndent: 25,
                                        color:  Color(0xFFB2EBF2),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: ListTile(
                                          onTap: (){
                                            Get.toNamed(RoutesName.client_select_site_view);
                                          },
                                          title: Text(
                                            'Site Images',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          trailing: Container(
                                            width: 30,
                                            height: 30,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              'assets/images/Group_11.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          dense: true,
                                          visualDensity: const VisualDensity(vertical: -3),

                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        indent: 25,
                                        endIndent: 25,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
/**************************End Client Portal*******************************************************/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
