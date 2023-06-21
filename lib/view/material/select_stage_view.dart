
import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/select_labour_head_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SelectStageView extends StatefulWidget {
  final Map<String,String> data;

   const SelectStageView({Key? key,required this.data}) : super(key: key);

  @override
  State<SelectStageView> createState() => _SelectStageViewState();
}

class _SelectStageViewState extends State<SelectStageView> {
  SelectViewModel selectView = SelectViewModel();
  @override
  void initState() {
    selectView.fetchStageListApi(widget.data);
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
            'Select Stage ',
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
              switch (value.stageList.status) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(
                      child: Text(value.stageList.message.toString()));
                case Status.COMPLETED:
                  return  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.stageList.data!.result!.length,
                    itemBuilder: (context, stage) {
                      var data = value.stageList.data!.result![stage];
                      // print(data.toJson().toString());

                      final bool isEven = stage % 2 == 0;
                      Color? color = isEven ? Colors.white : Colors.grey[100];

                      return Container(
                        color: color,
                        child: ListTile(
                          title: Text(data.stageName ?? ""),
                          onTap: () {
                            Get.back(result: '{"stageName":"${data.stageName}","stageId":"${data.stageId}"}',canPop: true);
                          },
                        ),
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
