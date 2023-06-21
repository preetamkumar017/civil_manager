import 'dart:io';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_widgets.dart';
import 'package:civil_manager/view_model/material_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';

class ReceivingMaterialImageCaptureView extends StatefulWidget {
  final Map<String, String> data;

  const ReceivingMaterialImageCaptureView({Key? key, required this.data})
      : super(key: key);

  @override
  State<ReceivingMaterialImageCaptureView> createState() =>
      _ReceivingMaterialImageCaptureViewState();
}

class _ReceivingMaterialImageCaptureViewState
    extends State<ReceivingMaterialImageCaptureView> {
  File? _image;
  final picker = ImagePicker();
  MaterialViewModel materialViewModel = MaterialViewModel();

  @override
  void initState() {
    super.initState();
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
          'Material Image Capture',
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
                          List<MultipartFile> files = [];
                          if (_image != null) {
                            files = [
                              await http.MultipartFile.fromPath("image", _image!.path),
                            ];
                          } else {
                          }
                          setState(() {});
                          materialViewModel.receivedMaterialApi(widget.data,files, context);
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

            ],
          ),

          ChangeNotifierProvider(
            create: (context) => materialViewModel,
            child: Consumer(builder: (BuildContext context, value, Widget? child) {
              return Visibility(
                visible: materialViewModel.getLoading,
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
