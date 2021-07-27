import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

///acostumbro a poner el sufijo Screen para indicar que la clase se refiere a una pantalla
///en este caso es redundante pero solo es por fines practivos
class PantallaTresScreen extends StatefulWidget {

  const PantallaTresScreen({Key key}) : super(key: key);

  @override
  _PantallaTresScreenState createState( ) => _PantallaTresScreenState();
}

class  _PantallaTresScreenState extends State<PantallaTresScreen>{

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
      child: Text("Mapa"),
    );
  }

}
