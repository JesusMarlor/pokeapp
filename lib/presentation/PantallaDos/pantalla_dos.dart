import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

///acostumbro a poner el sufijo Screen para indicar que la clase se refiere a una pantalla
///en este caso es redundante pero solo es por fines practivos
class PantallaDosScreen extends StatefulWidget {

  const PantallaDosScreen({Key key}) : super(key: key);

  @override
  _PantallaDosScreenState createState( ) => _PantallaDosScreenState();
}

class  _PantallaDosScreenState extends State<PantallaDosScreen>{

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      //search data
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: Text("Calendario personalizado"),
    );
  }

}
