import 'package:flutter/material.dart';
import 'package:pokeapp/presentation/Widgets/CustomCalendar/flutter_clean_calendar.dart';
import 'package:pokeapp/presentation/common/theme.dart';
import 'package:provider/provider.dart';

import '../../MainProvider.dart';

///acostumbro a poner el sufijo Screen para indicar que la clase se refiere a una pantalla
///en este caso es redundante pero solo es por fines practivos
class PantallaDosScreen extends StatefulWidget {

  const PantallaDosScreen({Key key}) : super(key: key);

  @override
  _PantallaDosScreenState createState( ) => _PantallaDosScreenState();
}

class  _PantallaDosScreenState extends State<PantallaDosScreen>{

  MainProvider mainProvider;

  final Map<DateTime, List<CleanCalendarEvent>> _events = {

    ///EVENTOS PREPARADOS
    DateTime(DateTime.now().year, DateTime.now().month, 3) : [
      CleanCalendarEvent('Holiday',
          startTime: DateTime(DateTime.now().year, DateTime.now().month, 3, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month, 3, 10, 0),
          description: 'Public holy day',
          color: Colors.red,
          typeDay: TypeDay.holiday
      ),
    ],

    DateTime(DateTime.now().year, DateTime.now().month, 8) : [
      CleanCalendarEvent('Holiday',
          startTime: DateTime(DateTime.now().year, DateTime.now().month, 8, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month, 8, 10, 0),
          description: 'Geometry weekly test',
          color: Colors.green,
          typeDay: TypeDay.test
      ),
    ],

    DateTime(DateTime.now().year, DateTime.now().month, 19) : [
      CleanCalendarEvent('Event',
          startTime: DateTime(DateTime.now().year, DateTime.now().month, 19, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month, 19, 12, 0),
          description: 'Public event',
          color: Colors.orange,
          typeDay: TypeDay.event
      ),
    ],

    DateTime(DateTime.now().year, DateTime.now().month, 22) : [
      CleanCalendarEvent('Test',
          startTime: DateTime(DateTime.now().year, DateTime.now().month, 22, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month, 22, 12, 0),
          description: 'Math weekly test',
          color: Colors.green,
          typeDay: TypeDay.test
      ),
    ],


    DateTime(DateTime.now().year, 8, 3) : [
      CleanCalendarEvent('Test',
          startTime: DateTime(DateTime.now().year, 8, 3, 10, 0),
          endTime: DateTime(DateTime.now().year, 8, 3, 12, 0),
          description: 'De otro mes',
          color: Colors.green,
          typeDay: TypeDay.test
      ),
    ],
  };

  @override
  void initState() {
    super.initState();
    mainProvider = Provider.of<MainProvider>(context, listen: false);
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: CalendarColors.primary,
          leading : InkWell(
              onTap: (){
                mainProvider.selectTab(0);
              },
              child: Icon( Icons.arrow_back_ios )
          )
      ),
      body: Calendar(
        startOnMonday: true,
        weekDays: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'],
        events: _events,
        primaryColor : CalendarColors.primary,
        eventDoneColor: Colors.green,
        selectedColor: CalendarColors.primary,
        todayColor: Colors.blue,
        eventColor: Colors.grey,
        locale: 'es_ES',
        todayButtonText: 'Go to Today',
        isExpandable: false,
        isExpanded: true,
        hideTodayIcon: true,
        expandableDateFormat: 'EEEE, dd. MMMM yyyy',
        dayOfWeekStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
      ),
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
