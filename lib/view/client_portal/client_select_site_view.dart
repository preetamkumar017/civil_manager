import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/select_labour_head_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ClientSelectSiteView extends StatefulWidget {
  const ClientSelectSiteView({Key? key}) : super(key: key);

  @override
  State<ClientSelectSiteView> createState() => _ClientSelectSiteViewState();
}

class _ClientSelectSiteViewState extends State<ClientSelectSiteView> {
  SelectViewModel selectView = SelectViewModel();
  @override
  void initState() {
    selectView.fetchSiteListRequestApi();
    super.initState();
  }

  @override
  void dispose() {
    selectView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              switch (value.siteRequestList.status) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(
                      child: Text(value.siteRequestList.message.toString()));
                case Status.COMPLETED:
                  return ListView.builder(
                    itemCount: value.siteRequestList.data!.siteList!.length,
                    itemBuilder: (context, index) {
                      var data = value.siteRequestList.data!.siteList![index];
                      return ListTile(
                        onTap: () {
                          Map<String, String>  pdata =   {"site_id":"${data.siteId}","full_name":"${data.siteName}"};
                          // print(pdata);
                          Get.toNamed(RoutesName.select_source_view,arguments: ScreenArguments(pdata));
                        },
                        title: Text(data.siteName ?? "",style: FlutterFlowTheme.of(context).subtitle1,),
                        iconColor: FlutterFlowTheme.of(context).primaryBackground,
                        trailing: const Icon(Icons.arrow_forward,weight: 2.0,size: 30),
                        leading: const Icon(Icons.home),
                        splashColor: FlutterFlowTheme.of(context).secondaryColor,

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
