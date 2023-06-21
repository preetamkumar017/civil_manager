import 'dart:developer';
import 'package:civil_manager/res/components/text_style.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectFloorView extends StatefulWidget {

  final Map<String,String> data ;
   const SelectFloorView({Key? key,required this.data}) : super(key: key);

  @override
  State<SelectFloorView> createState() => _SelectFloorViewState();
}

class _SelectFloorViewState extends State<SelectFloorView> {
  int floor = 0;
  @override
  void initState() {
    log(widget.data.toString());
     floor = int.parse( widget.data['floorttl'] ?? "");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    log(widget.data.toString());
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
        elevation: 0,
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      ),
      body: ListView.builder(
        itemCount: floor,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.back(result: '{"floorNum":"$index","floorName":"${addOrdinalSuffix(index)} floor"}',canPop: true);
            },
            title: Text("${addOrdinalSuffix(index)} floor"),
          );
        },

      ),
    );
  }
}
