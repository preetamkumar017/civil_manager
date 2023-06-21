

import 'package:civil_manager/res/components/get_version.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_util.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_widgets.dart';
import 'package:civil_manager/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unFocusNode = FocusNode();
  UserViewModel userViewModel = UserViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
          future: userViewModel.getUser(),
          builder: (context, snapshot) {

            if(snapshot.hasData)
            {
             return  Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(15, 30, 15, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: (){
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Group_55_(2).jpg',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data!.userName ?? "",
                            style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data!.designation ?? "",
                            style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.call,
                                  color:
                                  FlutterFlowTheme.of(context).secondaryBackground,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                  child: Text(
                                    snapshot.data!.mobile ?? "",
                                    style:
                                    FlutterFlowTheme.of(context).bodyText1.override(
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.email,
                                  color:
                                  FlutterFlowTheme.of(context).secondaryBackground,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                  child: Text(
                                    snapshot.data!.email ?? "",
                                    style:
                                    FlutterFlowTheme.of(context).bodyText1.override(
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/rupee.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Salary',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        'Rs. ${snapshot.data!.salary}.00',
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                              child: VerticalDivider(
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/calendar.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Joining Date',
                                        // snapshot.data!.joiningDate.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        DateFormat("dd MMM, yyyy").format(DateTime.parse(snapshot.data!.joiningDate.toString())),
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                if(await userViewModel.remove())
                                  {
                                    Get.offAllNamed(RoutesName.login_view);
                                  }

                              },
                              text: 'Log Out',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).primaryColor,
                                ),
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                 Align(
                   alignment: Alignment.bottomCenter,
                   child: FutureBuilder(
                     future: getVersion(),
                     builder: (context, snapshot) {
                       return Align(
                         alignment: Alignment.bottomCenter,
                         child: Text("Version: ${snapshot.data}"),
                       );
                     },),
                 )
               ],
             );
            }else
            {
              return  const Center(
                child: CircularProgressIndicator(),
              );
            }

          },
        ),
      ),
    );
  }
}
