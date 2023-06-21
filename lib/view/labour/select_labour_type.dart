import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLabourTypeView extends StatefulWidget {
  const SelectLabourTypeView({Key? key}) : super(key: key);

  @override
  State<SelectLabourTypeView> createState() => _SelectLabourTypeViewState();
}

class _SelectLabourTypeViewState extends State<SelectLabourTypeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Select From List ',
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
        body: ListView(
          children: [
            ListTile(
              onTap: () {
                Get.back(result: 'Kuli',canPop: true);
              },
              title: const Text("Kuli"),
            ),
            ListTile(
              onTap: () {
                Get.back(result: 'Mistri',canPop: true);
              },
              title: const Text("Mistri"),
            ),
            ListTile(
              onTap: () {
                Get.back(result: 'Reja',canPop: true);
              },
              title: const Text("Reja"),
            ),
          ],

        ));
  }
}
