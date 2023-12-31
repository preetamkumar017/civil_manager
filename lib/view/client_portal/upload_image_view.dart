import 'dart:developer';
import 'dart:io';

import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_widgets.dart';
import 'package:civil_manager/view_model/upload_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageView extends StatefulWidget {
  final Map data;

  const UploadImageView({Key? key, required this.data}) : super(key: key);

  @override
  _UploadImageViewState createState() => _UploadImageViewState();
}

class _UploadImageViewState extends State<UploadImageView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final UploadImageController uIController = Get.put(UploadImageController());

  @override
  void initState() {
    log(widget.data.toString());
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme
            .of(context)
            .alternate,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.059,
                      decoration: const BoxDecoration(),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color:
                                  FlutterFlowTheme
                                      .of(context)
                                      .highlightColour,
                                  size: 20,
                                ),
                                Text(
                                  widget.data['site_name'],
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .bodySmall,
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.person_sharp,
                                    color: FlutterFlowTheme
                                        .of(context)
                                        .highlightColour,
                                    size: 20,
                                  ),
                                  Text(
                                    widget.data['user_name'],
                                    style: FlutterFlowTheme
                                        .of(context)
                                        .bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.35,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme
                                .of(context)
                                .highlightColour,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: const AlignmentDirectional(0, 0),
                          child: Text(
                            uIController.getDate,
                            style: FlutterFlowTheme
                                .of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme
                                  .of(context)
                                  .alternate,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Obx(() {
                        return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 20, 0, 0),
                            child:
                            GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: uIController.getImagesListLength + 1,
                              itemBuilder: (context, index) {
                                if (index == uIController.getImagesListLength) {
                                  // Display the last item in the last position
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      _cameraWidget()
                                    ],
                                  );
                                } else {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.8,
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.17,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme
                                              .of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          border: Border.all(
                                            width: 3,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                          child:
                                          Image.file(
                                            uIController.getImagesList[index]!,
                                            // Use a different image for each item
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.7,
                                            height: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Construction',
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .labelMedium,
                                      ),
                                    ],
                                  );
                                }
                              },
                            )
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0, 10, 0, 10),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');

                          uIController.uploadImage(widget.data['site_id'],widget.data['user_name']);
                        },
                        text: 'Upload Images',
                        options: FFButtonOptions(
                          height: 40,
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme
                              .of(context)
                              .tertiary,
                          textStyle:
                          FlutterFlowTheme
                              .of(context)
                              .titleSmall
                              .override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          elevation: 3,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                return Visibility(
                  visible: uIController.getLoading,
                  child: Container(
                      alignment: Alignment.center,
                      color: Colors.white60,
                      child: const CircularProgressIndicator()),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _cameraWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () {
            _pickImageFromCamera();
          },
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.17,
            decoration: BoxDecoration(
              color: FlutterFlowTheme
                  .of(context)
                  .alternate,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: FlutterFlowTheme
                    .of(context)
                    .tertiary,
                width: 3,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  color: FlutterFlowTheme
                      .of(context)
                      .tertiary,
                  size: 24,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0, 10, 0, 0),
                  child: Text(
                    'Add Images',
                    style: FlutterFlowTheme
                        .of(context)
                        .displayLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Future<void> _pickImageFromCamera() async {
    final pickedFile = await uIController.picker.value.pickImage(
        source: ImageSource.camera, imageQuality: 10);

    File file = File(pickedFile!.path);
    uIController.addImagesList(file);
    log(uIController.getImagesListLength.toString());
  }
}
