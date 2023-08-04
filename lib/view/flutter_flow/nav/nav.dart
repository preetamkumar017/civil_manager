import 'dart:async';

import 'package:civil_manager/view/labour/add_labour_view.dart';
import 'package:civil_manager/view/dashboard_view.dart';
import 'package:civil_manager/view/dashboard2_view.dart';
import 'package:civil_manager/view/dashboard_civil_view.dart';
import 'package:civil_manager/view/footing_check_list_view.dart';
import 'package:civil_manager/view/labour/labour_list_view.dart';
import 'package:civil_manager/view/labour/labour_payment_filter_view.dart';
import 'package:civil_manager/view/labour/labour_attendance_screen1_view.dart';
import 'package:civil_manager/view/labour/labour_attendance_filter_view_temp.dart';
import 'package:civil_manager/view/labour/labour_list_filter_view.dart';
import 'package:civil_manager/view/login_view.dart';
import 'package:civil_manager/view/plinth_check_list_view.dart';
import 'package:civil_manager/view/sab_casting2_view.dart';
import 'package:civil_manager/view/site_engineer2_view.dart';
import 'package:civil_manager/view/site_engineer3_view.dart';
import 'package:civil_manager/view/site_incharge1_view.dart';
import 'package:civil_manager/view/site_incharge2_view.dart';
import 'package:civil_manager/view/slab_check_list1_view.dart';
import 'package:civil_manager/view/supervisor_page2_view.dart';
import 'package:civil_manager/view/supervisor_page3_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          : const AddLabourView(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : const AddLabourView(),
          routes: [
            FFRoute(
              name: 'addlabour',
              path: 'addlabour',
              builder: (context, params) => const AddLabourView(),
            ),
            FFRoute(
              name: 'slab_checklist1',
              path: 'slabChecklist1',
              builder: (context, params) => const SlabCheckList1View(),
            ),
            FFRoute(
              name: 'Supervisorpage2',
              path: 'supervisorpage2',
              builder: (context, params) => const SupervisorPage2View(),
            ),
            FFRoute(
              name: 'supervisorpage3',
              path: 'supervisorpage3',
              builder: (context, params) => const SupervisorPage3View(),
            ),
            FFRoute(
              name: 'Labourlistfilter',
              path: 'labourlistfilter',
              builder: (context, params) => const LabourListFilterView(),
            ),
            FFRoute(
              name: 'labour_attendance',
              path: 'labourAttendance',
              builder: (context, params) => const LabourAttendanceScreen1View(),
            ),
            // FFRoute(
            //   name: 'labour_Attendancesrc2',
            //   path: 'labourAttendancesrc2',
            //   builder: (context, params) =>  LabourAttendanceScreen2View(),
            // ),
            FFRoute(
              name: 'labouelist',
              path: 'labouelist',
              builder: (context, params) => const LabourListView(),
            ),
            FFRoute(
              name: 'labourpaymentfilter',
              path: 'labourpaymentfilter',
              builder: (context, params) => const LabourPaymentFilterView(),
            ),
            // FFRoute(
            //   name: 'AttendanceList',
            //   path: 'AttendanceList',
            //   builder: (context, params) => const AttendanceListView(),
            // ),
            FFRoute(
              name: 'Site_engg3',
              path: 'siteEngg3',
              builder: (context, params) => const SiteEngineer3View(),
            ),
            // FFRoute(
            //   name: 'labour_payment',
            //   path: 'labourPayment',
            //   builder: (context, params) =>  LabourPaymentView(),
            // ),
            FFRoute(
              name: 'labourattenfilter',
              path: 'labourattenfilter',
              builder: (context, params) => const LabourAttendanceFilterView(),
            ),
            FFRoute(
              name: 'dashboard',
              path: 'dashboard',
              builder: (context, params) => const DashboardView(),
            ),
            FFRoute(
              name: 'dashboard2',
              path: 'dashboard2',
              builder: (context, params) => const Dashboard2View(),
            ),
            FFRoute(
              name: 'LOGIN',
              path: 'login',
              builder: (context, params) => const LoginView(),
            ),
            FFRoute(
              name: 'Site_engg2',
              path: 'siteEngg2',
              builder: (context, params) => const SiteEngineer2View(),
            ),
            FFRoute(
              name: 'Site_incharge2',
              path: 'siteIncharge2',
              builder: (context, params) => const SiteInCharge2View(),
            ),
            FFRoute(
              name: 'dashboardcivil',
              path: 'dashboardcivil',
              builder: (context, params) => const DashboardCivilView(),
            ),
            FFRoute(
              name: 'Site_incharge1',
              path: 'siteIncharge1',
              builder: (context, params) => const SiteInCharge1View(),
            ),
            FFRoute(
              name: 'Sab_casting2',
              path: 'sabCasting2',
              builder: (context, params) => const SabCasting2View(),
            ),
            FFRoute(
              name: 'Footingchecklist',
              path: 'footingchecklist',
              builder: (context, params) => const FootingCheckListView(),
            ),
            FFRoute(
              name: 'plinthchecklist',
              path: 'plinthchecklist',
              builder: (context, params) => const PlinthCheckListView(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      // urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    // ..addAll(params)
    // ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}
