import 'dart:io';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_widgets.dart';
import 'package:civil_manager/view_model/labour_list_for_attendence_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';

class LabourImageCaptureView extends StatefulWidget {
  final String data;

  const LabourImageCaptureView({Key? key, required this.data})
      : super(key: key);

  @override
  State<LabourImageCaptureView> createState() =>
      _LabourImageCaptureViewState();
}

class _LabourImageCaptureViewState
    extends State<LabourImageCaptureView> {
  File? _image;
  final picker = ImagePicker();
  // MaterialViewModel _labourListForAttendanceViewModel1 = MaterialViewModel();

  final LabourListForAttendanceViewModel _labourListForAttendanceViewModel = LabourListForAttendanceViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _labourListForAttendanceViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final labourAddAttendanceViewModel = Provider.of<LabourListForAttendanceViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Group Image Capture',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryBtnText,
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
        ),
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.7,
                child: Visibility(
                  visible: _image == null,
                  replacement: Container(
                    child: _buildImage(),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10.0),
                    child: FFButtonWidget(
                      text: "Take Image",
                      onPressed: () {
                        _pickImageFromCamera();
                      },
                      options: FFButtonOptions(
                        width: 200,
                        height: 50,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _image != null,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: SliderButton(
                          dismissible: true,
                        action: () async {
                          List<http.MultipartFile> files = [];
                          if (_image != null) {
                            files = [
                              await http.MultipartFile.fromPath("image", _image!.path),
                            ];
                          } else {
                          }
                          setState(() {});
                          labourAddAttendanceViewModel.labourAddAttendanceApi(widget.data,files, context);

                      },
                        label: const Text(
                          "Slide to submit",
                          style: TextStyle(
                              color: Color(0xff4a4a4a),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        icon: const Icon(Icons.double_arrow_rounded,size: 40,),
                    )),
                  ),
                ),
              ),
              // ElevatedButton(onPressed: () async {
              //   List<MultipartFile> files = [];
              //   if (_image != null) {
              //     files = [
              //       await http.MultipartFile.fromPath("image", _image!.path),
              //     ];
              //   } else {
              //   }
              //   setState(() {});
              //   labourAddAttendanceViewModel.labourAddAttendanceApi(widget.data,files, context);
              //   // materialViewModel.receivedMaterialApi(widget.data,files, context);
              // }, child: Text("Submit"))

              // Container(
              //   alignment: Alignment.center,
              //   margin: const EdgeInsets.all(10.0),
              //   child: FFButtonWidget(
              //     text: "submit",
              //     onPressed: () async {
              //       List<MultipartFile> files = [];
              //       if (_image != null) {
              //         files = [
              //           await http.MultipartFile.fromPath("image", _image!.path),
              //         ];
              //       } else {
              //       }
              //       setState(() {});
              //       // materialViewModel.receivedMaterialApi(widget.data,files, context);
              //     },
              //     options: FFButtonOptions(
              //       width: 200,
              //       height: 50,
              //       color: FlutterFlowTheme.of(context).tertiaryColor,
              //       textStyle:
              //       FlutterFlowTheme.of(context).subtitle2.override(
              //         fontFamily: 'Poppins',
              //         color: Colors.white,
              //         fontSize: 14,
              //         fontWeight: FontWeight.normal,
              //       ),
              //       borderSide: const BorderSide(
              //         color: Colors.transparent,
              //         width: 1,
              //       ),
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //   ),
              // ),
            ],
          ),
          ChangeNotifierProvider(
            create: (context) => _labourListForAttendanceViewModel,
            child: Consumer(builder: (BuildContext context, value, Widget? child) {
              return Visibility(
                visible: _labourListForAttendanceViewModel.getLoadingImage,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black12,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },

            ),
          )
        ],
      ),
    );
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera,imageQuality: 10);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  Widget _buildImage() {
    if (_image != null) {
      return Image.file(_image!);
    } else {
      return const Text('No image selected.');
    }
  }
}
