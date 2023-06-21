import 'dart:developer';

import 'package:civil_manager/data/response/status.dart';
import 'package:civil_manager/model/site_wise_stock_model.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/stock_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class StockView extends StatefulWidget {
  Map<String, String> data;
  StockView({Key? key, required this.data}) : super(key: key);

  @override
  State<StockView> createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {
  StockViewModel selectView = StockViewModel();
  Map sdata={};

  @override
  void initState() {
     sdata = {
      "site_id":widget.data['id']
    };
    selectView.fatchStockListApi(sdata);
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
            widget.data['full_name'].toString(),
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                controller: selectView.search,
                onChanged: (value) => selectView.notifyListeners() ,
              ),
            ),
            Expanded(
              child: ChangeNotifierProvider<StockViewModel>(
                create: (context) => selectView,
                child: Consumer<StockViewModel>(
                  builder: (context, value, _) {
                    switch (value.stock.status) {
                      case Status.LOADING:
                        return const Center(child: CircularProgressIndicator());
                      case Status.ERROR:
                        return Center(
                            child: Text(value.stock.message.toString()));
                      case Status.COMPLETED:
                        var data = value.stock.data!.materialList;
                        log(data!
                            .where((element) => element.matName!
                                .toLowerCase()
                                .contains(selectView.search.text.toLowerCase()))
                            .length
                            .toString());

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data
                              .where((element) => element.matName!
                                  .toLowerCase()
                                  .contains(
                                      selectView.search.text.toLowerCase()))
                              .length,
                          // itemCount: value.stock.data!.materialList!.length,
                          itemBuilder: (context, index) {
                            MaterialList materialList = data[index];
                            try {
                              materialList = data.where((element) => element
                                  .matName!
                                  .toLowerCase()
                                  .contains(selectView.search.text
                                      .toLowerCase())).toList()[index];
                            } catch (e) {
                              debugPrint("");
                            }

                            final bool isEven = index % 2 == 0;
                             Color? color = isEven ? Colors.white : Colors.grey[100];

                            if(materialList.matQty=="0")
                              {
                                color = Colors.red[100];
                              }

                            return   Container(
                              color: color,
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(30, 15, 30, 15),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: Get.width*0.45,
                                            child: Text(
                                              materialList.matName ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              style: FlutterFlowTheme.of(context).bodyText1,
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "${materialList.matQty} ",
                                                  style: const TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: materialList.matUnit ?? "",
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(context).bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Divider(
                                    //   thickness: 1,
                                    //   indent: 25,
                                    //   endIndent: 25,
                                    // ),
                                  ],
                                ),
                            );

                            // return Container(
                            //   decoration: BoxDecoration(
                            //     border: Border(
                            //       bottom: BorderSide(
                            //         color: Colors.grey,
                            //         width: 1.0,
                            //       ),
                            //     ),
                            //   ),
                            //   child: ListTile(
                            //
                            //     title: Padding(
                            //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(materialList.matName ?? ""),
                            //           Text("${materialList.matQty} ${materialList.matUnit}" )
                            //         ],
                            //       ),
                            //     ),
                            //
                            //   ),
                            // );
                          },
                        );

                      default:
                        break;
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
