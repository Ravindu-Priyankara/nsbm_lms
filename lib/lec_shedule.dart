
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class lecSchedule extends StatefulWidget {
  const lecSchedule({Key? key}) : super(key: key);

  @override
  State<lecSchedule> createState() => _lecScheduleState();
}

class _lecScheduleState extends State<lecSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "lecture Schedule",
            style: TextStyle(
              fontSize: 31,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontFamily: 'Open Sans',
            ),
          ),
        ),
      body: Column(
        children: [
          SfCalendar(
            view: CalendarView.month,

          ),
          SfCalendar(
            view: CalendarView.schedule,
            scheduleViewSettings: ScheduleViewSettings(
              appointmentItemHeight: 70,
              hideEmptyScheduleWeek: true,
            ),
            specialRegions: _getTimeRegions(),
            /*view: CalendarView.workWeek,
            specialRegions: _getTimeRegions(),
            firstDayOfWeek: 1,
            timeSlotViewSettings: TimeSlotViewSettings(
              startHour: 8,
              endHour: 23,
              nonWorkingDays: <int>[DateTime.sunday,DateTime.saturday]
            ),*/
          ),
        ],
      ),
    );
  }
  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];
    regions.add(
        TimeRegion(
            startTime: DateTime.now(),
            endTime: DateTime.now().add(Duration(hours: 1)),
            enablePointerInteraction: false,
            textStyle: TextStyle(color: Colors.red, fontSize: 15),
            color: Color.fromRGBO(255, 236, 179, 1.0),
            iconData: Icons.group
        ),
    );

    return regions;
  }

}

//https://github.com/SyncfusionExamples/firebase-get-and-update-wth-flutter-event-calendar/blob/main/lib/main.dart
//https://support.syncfusion.com/kb/article/10404/how-to-work-with-the-firebase-database-and-the-flutter-calendar-for-appointments
//https://pub.dev/packages/syncfusion_flutter_calendar

