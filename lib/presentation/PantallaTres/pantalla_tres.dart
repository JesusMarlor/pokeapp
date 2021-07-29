import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../presentation/common/theme.dart';
import 'map_style.dart';

///acostumbro a poner el sufijo Screen para indicar que la clase se refiere a una pantalla
///en este caso es redundante pero solo es por fines practivos
class PantallaTresScreen extends StatefulWidget {

  const PantallaTresScreen({Key key}) : super(key: key);

  @override
  _PantallaTresScreenState createState( ) => _PantallaTresScreenState();
}

class  _PantallaTresScreenState extends State<PantallaTresScreen> with WidgetsBindingObserver{

  MapStyle mapStyle = MapStyle();
  GoogleMapController mapController;
  CameraPosition positionInitial = CameraPosition(target: LatLng(-37.843359, 145.0740481) , zoom : 16 );

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && mapController != null ) {
      Future.delayed( Duration( seconds: 1), (){
        setState((){
          //mapController?.setMapStyle("[]");
          mapController.setMapStyle(mapStyle.getMapStyle());
        });
      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: positionInitial,
              buildingsEnabled: false,
              indoorViewEnabled: false,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,),
          SearchBox(),
          MapInfo(),
        ]
    );
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      mapController.setMapStyle(mapStyle.getMapStyle());
    });
  }

}

class MapInfo extends StatelessWidget{

  const MapInfo({Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: true,
        maxChildSize: 0.4,
        initialChildSize: 0.4,
        minChildSize: 0.3,
        builder: (context, controller) {
          return AnimatedContainer(
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: ListView(
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.width * .43,
                      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
                      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color(0xFF3A5160).withOpacity(0.2),
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * .4,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(text: '\$5', style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w800)),
                                            TextSpan(text: '/Hr', style: TextStyle(
                                                color: MapColors.grey,
                                                fontSize: 11)),
                                          ],
                                        )
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Icon(Icons.star, color: MapColors.grey ),
                                            SizedBox( width: 5 ),
                                            Text("102 Fordham Rd", style: TextStyle( fontSize: 18 )),
                                          ],
                                        ),
                                        Text("San jose", style: TextStyle( color: MapColors.grey, fontSize: 11 ), textAlign: TextAlign.end),
                                      ],
                                    )

                                  ],
                                ),
                                //Divider(),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0 ),
                                    color: MapColors.grey.withOpacity(0.3),
                                    child: SizedBox( width: double.infinity, height: 1 )
                                ),
                                Row(
                                    children: [
                                      Text("Avaliable spaces", style: TextStyle( color: MapColors.grey, fontSize: 11) )
                                    ],
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric( vertical: 5, horizontal: 0),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width : MediaQuery.of(context).size.width * .45,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.5),
                                              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                            ),
                                            child: Text(""),
                                          ),
                                          Container(
                                            width : MediaQuery.of(context).size.width * .2,
                                            decoration: BoxDecoration(
                                              color: MapColors.green,
                                              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                            ),
                                            child: Text(""),
                                          )
                                        ],
                                      ),
                                      SizedBox( width: 5 ),
                                      Text("4", style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800))
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/foot.png", height: 25, width: 25, alignment: Alignment.centerLeft),
                                    SizedBox( width: 5 ),
                                    Text("124 meters walk", style: TextStyle( color: MapColors.grey, fontSize: 11 ))
                                  ],
                                )
                              ],
                            )
                          ),
                        ],
                      )),
                  Container(
                  height: MediaQuery.of(context).size.height * .09,
                    margin:  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: FlatButton(
                      onPressed: () {

                      },
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text("Go!", style: TextStyle( fontSize: 20, color: Colors.white ))),
                      textColor: Colors.black,
                      color: MapColors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ),
                ]
            ),
          );
        });
  }
}

class SearchBox extends StatelessWidget{

  const SearchBox({Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 0.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon( Icons.menu, size: 35,), onPressed: ()=> print("press menu")),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color(0xFF3A5160).withOpacity(0.2),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: InkWell(
                      onTap: ()=> print("navigation"),
                      child: Image.asset("assets/navigation.png", height: 25, width: 25,),
                    ),
                  )

                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 5),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xFF3A5160).withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left:3, right: 8, top: 3, bottom: 3),
                        child: Icon( Icons.location_on_rounded, color: MapColors.grey )
                    ),
                    Expanded(
                      child: Text("102 Fordham RD"),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon( Icons.close, color: MapColors.grey  )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(3),
                        child: Icon( Icons.list, color: MapColors.grey  )
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
