import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/select_labour_head_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SelectSiteView extends StatefulWidget {
  const SelectSiteView({super.key});


  @override
  State<SelectSiteView> createState() => _SelectSiteViewState();
}

class _SelectSiteViewState extends State<SelectSiteView> {
  SelectViewModel selectView = SelectViewModel();
  @override
  void initState() {
    selectView.fetchSiteListApi();
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
              switch (value.siteList.status) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(
                      child: Text(value.siteList.message.toString()));
                case Status.COMPLETED:
                  return ListView.builder(
                    itemCount: value.siteList.data!.siteList!.length,
                    itemBuilder: (context, index) {
                      var data = value.siteList.data!.siteList![index];

                      final bool isEven = index % 2 == 0;
                      Color? color = isEven ? Colors.white : Colors.grey[100];
                      return Container(
                        color: color,
                        child: ListTile(
                          onTap: () {
                            Get.back(result: '{"full_name":"${data.name}","id":"${data.id}","floorNum":"${data.floorNum}"}',canPop: true);
                          },
                          title: Text(data.name ?? ""),
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
