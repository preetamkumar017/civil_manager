import 'dart:developer';

import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/calender_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderView extends StatefulWidget {
  Map data;

  CalenderView({super.key, required this.data});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  final ciController = Get.put(CalenderImageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title:  Text(widget.data['site_name'] ?? ""),
            centerTitle: true,
            elevation: 0,
            backgroundColor: FlutterFlowTheme.of(context).primary,
          ),
          body: SizedBox(
            child: Obx(() {
              return SfCalendar(
                view: CalendarView.month,
                dataSource: ciController.mts.value,
                monthViewSettings:  MonthViewSettings(
                    appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                    appointmentDisplayCount: ciController.mts.value.appointments!.length,
                    numberOfWeeksInView:6,
                    dayFormat:"EEE",
                    showAgenda: true,
                    agendaItemHeight : 40,
                    showTrailingAndLeadingDates : true,
                    agendaViewHeight : -1,
                    monthCellStyle : const MonthCellStyle(),
                    agendaStyle : const AgendaStyle()
                ),
                onViewChanged: (viewChangedDetails) async {
                  String year = viewChangedDetails.visibleDates[7].year.toString();
                  String month = viewChangedDetails.visibleDates[7].month.toString().padLeft(2, '0');
                  String formattedDate = year + '-' + month;
                  print(formattedDate);
                  ciController.date.value =
                      formattedDate; // (viewChangedDetails.visibleDates[7].year).toString()+"-"+(viewChangedDetails.visibleDates[7].month).toString();
                  await ciController.getData(widget.data['site_id'], context);

                },
              );
            }),
          )),
    );
    ;
  }


}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
