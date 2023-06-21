import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/select_labour_head_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SelectLabourHeadView extends StatefulWidget {
  const SelectLabourHeadView({super.key});


  @override
  State<SelectLabourHeadView> createState() => _SelectLabourHeadViewState();
}

class _SelectLabourHeadViewState extends State<SelectLabourHeadView> {
  SelectViewModel selectView = SelectViewModel();
  @override
  void initState() {
    selectView.fetchHeadListApi();
    super.initState();
  }

  @override
  void dispose() {
    selectView.dispose();
    super.dispose();
  }

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
        body: ChangeNotifierProvider<SelectViewModel>(
          create: (context) => selectView,
          child: Consumer<SelectViewModel>(
            builder: (context, value, _) {
              switch (value.labourHeadList.status) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(
                      child: Text(value.labourHeadList.message.toString()));
                case Status.COMPLETED:
                  return ListView.builder(
                    itemCount: value.labourHeadList.data!.labourHead!.length,
                    itemBuilder: (context, index) {
                      var data = value.labourHeadList.data!.labourHead![index];
                      return ListTile(
                        onTap: () {
                          Get.back(result: '{"full_name":"${data.fullName}","id":"${data.id}"}',canPop: true);
                        },
                        title: Text(data.fullName ?? ""),
                      );
                    },

                  );

                default:
                  break;
              }
              return Container();
            },
          ),
        ));
  }
}
