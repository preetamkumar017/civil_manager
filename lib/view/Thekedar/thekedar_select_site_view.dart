import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/select_labour_head_view_model.dart';
import 'package:civil_manager/view_model/site_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ThekedarSelectSiteView extends StatefulWidget {
  const ThekedarSelectSiteView({Key? key}) : super(key: key);

  @override
  State<ThekedarSelectSiteView> createState() => _ThekedarSelectSiteViewState();
}

class _ThekedarSelectSiteViewState extends State<ThekedarSelectSiteView> {
  SiteListViewModel selectView = SiteListViewModel();
  @override
  void initState() {
    selectView.fatchSiteListApi();
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
        body: ChangeNotifierProvider<SiteListViewModel>(
          create: (context) => selectView,
          child: Consumer<SiteListViewModel>(
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
                            Map<String, String> pdata = {
                              "site_id":data.id.toString(),
                              "site_name":data.name.toString()
                            };
                            Get.toNamed(RoutesName.thekedar_work_list_view,arguments: ScreenArguments(pdata));
                          },
                          title: Text(data.name ?? "",style: FlutterFlowTheme.of(context).subtitle1,),
                          iconColor: FlutterFlowTheme.of(context).primaryBackground,
                          trailing: const Icon(Icons.arrow_forward,weight: 2.0,size: 30),
                          leading: const Icon(Icons.home),
                          splashColor: FlutterFlowTheme.of(context).secondaryColor,

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
