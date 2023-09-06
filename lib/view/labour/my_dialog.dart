import 'dart:developer';

import 'package:civil_manager/utils/utils.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/attendance_edit_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/labour_list_after_attendance_model.dart';

class MyDialog extends StatefulWidget {
  final Result data;

  MyDialog(this.data);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  bool present = false;
  bool halfDay = false;
  bool night = false;
  TextEditingController commitment = TextEditingController();
  final atteEdit = Get.put(AttendanceEditViewModel());
  bool loading = false;
  @override
  void initState() {
    super.initState();
    present = widget.data.present == "1";
    halfDay = widget.data.halfday == "0.5";
    night = widget.data.night == "1";
    commitment.text = widget.data.labourWork ?? "";
  }

  @override
  Widget build(BuildContext context) {
    if(!loading) {
      return AlertDialog(
        title: const Text('Edit Attendance'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 85,
                    child: Text(
                      'Name',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Present',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                        Text(
                          'Half',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                        Text(
                          'Night',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.03,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 2, 2, 2),
                            child: Text(
                              widget.data.labourName ?? "",
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: Checkbox(
                          value: present,
                          onChanged: (value) {
                            setState(() {
                              present = value!;
                              log(present.toString());
                            });
                          },
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: Checkbox(
                          value: halfDay,
                          onChanged: (value) {
                            halfDay = value!;
                            setState(() {});
                          },
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        child: Checkbox(
                          value: night,
                          onChanged: (newValue) async {
                            night = newValue!;
                            if(!newValue) {
                              commitment.text = "";
                            }
                            setState(() {});
                          },
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (night)
                TextFormField(
                  controller: commitment,
                  decoration: const InputDecoration(hintText: "Enter Comments"),
                )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Submit'),
            onPressed: () async {
              if(present || halfDay || night){
                Map frmData = {
                  "submit": "true",
                  "id": widget.data.id,
                  "present": present ? "1" : "0",
                  "halfday": halfDay ? "0.5" : "0",
                  "night": night ? "1" : "0",
                };
                if (night && commitment.text == "") {
                  Utils.flushBarErrorMessage("Please Insert Comment", context);
                } else {
                  frmData['labour_work'] = commitment.text;
                  loading = true;
                  setState(() {});
                  await atteEdit
                      .labourAttendanceEdit(frmData, context)
                      .then((value) {
                    loading = false;
                    setState(() {});
                  });

                  Navigator.of(context).pop();
                }
              }else
              {
                Utils.flushBarErrorMessage("Attendance acn not null", context);
              }
            },
          ),
        ],
      );
    }
    else
      {
        return const Center(child: CircularProgressIndicator());
      }
  }

}