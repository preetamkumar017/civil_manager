import 'dart:developer';
import 'package:civil_manager/index.dart';
import 'package:civil_manager/model/arguments.dart';
import 'package:civil_manager/res/components/image_viewer.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/Thekedar/thekedar_image_view.dart';
import 'package:civil_manager/view/Thekedar/thekedar_list_view.dart';
import 'package:civil_manager/view/Thekedar/thekedar_select_site_view.dart';
import 'package:civil_manager/view/Thekedar/thekedar_work_list_view.dart';
import 'package:civil_manager/view/client_portal/cctv_image_view.dart';
import 'package:civil_manager/view/client_portal/client_select_site_view.dart';
import 'package:civil_manager/view/client_portal/upload_image_view.dart';
import 'package:civil_manager/view/client_portal/manual_uploaded_view.dart';
import 'package:civil_manager/view/labour/edit_labour_view.dart';
import 'package:civil_manager/view/labour/labour_image_capture_view.dart';
import 'package:civil_manager/view/labour/labour_show_attendance_screen1_view.dart';
import 'package:civil_manager/view/material/select_site_view.dart';
import 'package:civil_manager/view/material/stock_select_site_view.dart';
import 'package:civil_manager/view/material/stock_view.dart';
import 'package:civil_manager/view/night_modal_view.dart';
import 'package:civil_manager/view/profile_view.dart';
import 'package:civil_manager/view/material/receiving_history_filter_view.dart';
import 'package:civil_manager/view/material/receiving_history_view.dart';
import 'package:civil_manager/view/material/receiving_material_image_capture_view.dart';
import 'package:civil_manager/view/material/receiving_select_site_view.dart';
import 'package:civil_manager/view/material/request_form_view.dart';
import 'package:civil_manager/view/material/receiving_material_view.dart';
import 'package:civil_manager/view/material/receiving_material_select_site_view.dart';
import 'package:civil_manager/view/material/requested_material_list_site_view.dart';
import 'package:civil_manager/view/material/requested_material_list_stage_view.dart';
import 'package:civil_manager/view/material/requested_material_list_view.dart';
import 'package:civil_manager/view/select_floor_view.dart';
import 'package:civil_manager/view/labour/select_labour_head_view.dart';
import 'package:civil_manager/view/labour/select_labour_type.dart';
import 'package:civil_manager/view/material/required_select_stage_view.dart';
import 'package:civil_manager/view/material/required_select_site_view.dart';
import 'package:civil_manager/view/material/select_stage_view.dart';
import 'package:civil_manager/view/client_portal/select_source_view.dart';
import 'package:civil_manager/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../model/labour_list_model.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    log(settings.name ?? "");
    switch (settings.name) {

      case RoutesName.splash:
        return GetPageRoute(
            page: () => const SplashView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.add_labour_view:
        return GetPageRoute(
            page: () => const AddLabourView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.edit_labour_view:
        LabourList data = settings.arguments as LabourList;
        return GetPageRoute(
            page: () =>  EditLabourView(data: data,),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.attendance_list_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
            page: () => AttendanceListView(data: args.data),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.dashboard2_view:
        return GetPageRoute(
            page: () => const Dashboard2View(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.dashboard_civil_view:
        return GetPageRoute(
            page: () => const DashboardCivilView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.dashboard_view:
        return GetPageRoute(
            page: () => const DashboardView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.footing_check_list_view:
        return GetPageRoute(
            page: () => const FootingCheckListView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.labour_attendance_filter_view:
        return GetPageRoute(
            page: () => const LabourAttendanceFilterView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.labour_attendance_screen2_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
            page: () => LabourAttendanceScreen2View(data: args.data),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.labour_attendance_screen1_view:
        return GetPageRoute(
            page: () => const LabourAttendanceScreen1View(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.labour_list_filter_view:
        return GetPageRoute(
            page: () => const LabourListFilterView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.labour_list_view:
        return GetPageRoute(
            page: () => const LabourListView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.labour_payment_filter_view:
        return GetPageRoute(
            page: () => const LabourPaymentFilterView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.labour_payment_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
            page: () => LabourPaymentView(data: args.data,),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.labour_image_capture_view:
        final args = settings.arguments as ScreenArgumentsString;
        return GetPageRoute(
            page: () => LabourImageCaptureView(data: args.data,),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));




      case RoutesName.login_view:
        return GetPageRoute(
            page: () => const LoginView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.night_modal_view:
        return GetPageRoute(
            page: () => const NightModalView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.plinth_check_list_view:
        return GetPageRoute(
            page: () => const PlinthCheckListView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.sab_casting2_view:
        return GetPageRoute(
            page: () => const SabCasting2View(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.site_engineer2_view:
        return GetPageRoute(
            page: () => const SiteEngineer2View(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.site_engineer3_view:
        return GetPageRoute(
            page: () => const SiteEngineer3View(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.site_incharge1_view:
        return GetPageRoute(
            page: () => const SiteInCharge1View(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.site_incharge2_view:
        return GetPageRoute(
            page: () => const SiteInCharge2View(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.slab_check_list1_view:
        return GetPageRoute(
            page: () => const SlabCheckList1View(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.supervisor_page2_view:
        return GetPageRoute(
            page: () => const SupervisorPage2View(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.supervisor_page3_view:
        return GetPageRoute(
            page: () => const SupervisorPage3View(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.select_labour_head_view:
        return GetPageRoute(
            page: () => const SelectLabourHeadView(),
            fullscreenDialog: true,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.select_labour_type_view:
        return GetPageRoute(
            page: () => const SelectLabourTypeView(),
            fullscreenDialog: true,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.select_site_view:
        return GetPageRoute(
            page: () => const SelectSiteView(),
            fullscreenDialog: true,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.select_floor_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
            page: () => SelectFloorView(data: args.data),
            fullscreenDialog: true,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.labour_show_attendance_screen1_view:
        return GetPageRoute(
            page: () => const LabourShowAttendanceScreen1View(),
            fullscreenDialog: true,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.labour_show_attendance_screen2_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
            page: () => AttendanceListView(data: args.data),
            fullscreenDialog: true,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));
      case RoutesName.request_select_site_view:
        return GetPageRoute(
            page: () => const RequiredSelectSiteView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.request_select_stage_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
            page: () => RequiredSelectStageView(data: args.data),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.request_form_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
            page: () => RequestFormView(data: args.data),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.receiving_material_select_site_view:
        return GetPageRoute(
            // fullscreenDialog: true,
            page: () => const ReceivingMaterialSelectSiteView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.select_stage_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
            page: () => SelectStageView(data: args.data),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.receiving_history_select_site_view:
        return GetPageRoute(
            page: () => const ReceivingHistorySelectSiteView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.receiving_history_view:
        return GetPageRoute(
            page: () => const ReceivingHistoryView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.receiving_history_filter_view:
        return GetPageRoute(
            page: () => const ReceivingHistoryFilterView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));


      case RoutesName.receiving_material_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
            page: () => ReceivingMaterialView(data: args.data),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600),
         );

      case RoutesName.requested_material_list_site_view:
        return GetPageRoute(
            page: () => const RequestedMaterialListSiteView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));


      case RoutesName.requested_material_list_stage_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
          page: () => RequestedMaterialListStageView(data: args.data),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
        );

      case RoutesName.requested_material_list_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
          page: () => RequestedMaterialListView(data: args.data),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
        );

      case RoutesName.profile_view:
        return GetPageRoute(
            page: () => const ProfileView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.receiving_material_image_capture_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
          page: () =>  ReceivingMaterialImageCaptureView(data: args.data),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
        );

      case RoutesName.stock_select_site_view:
        return GetPageRoute(
            page: () => const StockSelectSiteView(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 600));

      case RoutesName.stock_view:
        final args = settings.arguments as ScreenArguments;
        return GetPageRoute(
          page: () =>  StockView(data: args.data),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600),
        );


      case RoutesName.image_viewer:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
            builder: (BuildContext context) => MyImageView(data: args.data));


      case RoutesName.select_source_view:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
            builder: (BuildContext context) =>  SelectSourceView(data: args.data));

      case RoutesName.client_select_site_view:
        // final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
            builder: (BuildContext context) =>  const ClientSelectSiteView());

      case RoutesName.cctv_image_view:
      final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
            builder: (BuildContext context) => CctvImageView(data: args.data));

      case RoutesName.upload_image_view:
      final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
            builder: (BuildContext context) => UploadImageView(data: args.data));

      case RoutesName.manual_uploaded_image_view:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
            builder: (BuildContext context) => ManualImageUploadedView(data: args.data));

      case RoutesName.thekedar_select_site:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ThekedarSelectSiteView());

      case RoutesName.thekedar_work_list_view:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
            builder: (BuildContext context) => WorkCompletedListView(data: args.data));

      case RoutesName.thekedar_list_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ThekedarListView());
      case RoutesName.thekedar_image_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ThekedarImageView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
