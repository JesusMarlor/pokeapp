import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pokeapp/presentation/PantallaDos/pantalla_dos.dart';
import 'package:pokeapp/presentation/PantallaTres/pantalla_tres.dart';
import 'package:pokeapp/presentation/PantallaUno/pantalla_uno.dart';
import 'package:provider/provider.dart';
import '../../MainProvider.dart';
import '../../presentation/common/navbar_buttom.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key key }) : super(key: key);

  @override
  _HomeScreenState createState( ) => _HomeScreenState();
}

class  _HomeScreenState extends State<HomeScreen>{

  MainProvider mainProvider;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      //search data
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    mainProvider = Provider.of<MainProvider>(context, listen: true);

    return Scaffold(
          body: Column(
            children: [
              //igual se puede usar un IndexedStack
              Expanded(
                child: PageView(
                  pageSnapping: false,
                  physics: new NeverScrollableScrollPhysics(),
                  controller: mainProvider.pageController,
                  onPageChanged : ( index ){
                    mainProvider.selectTab(index);
                    print("onPageChanged->index: $index");
                  },
                  children: [
                    PantallaUnoScreen(),
                    PantallaDosScreen(),
                    PantallaTresScreen()
                  ],
                )
              ),
            ],
          ),
          bottomNavigationBar: NavbarButtom(
            selectedIndex: mainProvider.selectedTabIndex,
            onItemSelected: (index){
              print("====>cambiar a: $index");
              mainProvider.selectTab(index);
              mainProvider.pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            },
            items: [
              BottomBarItem(icon: Icon(Icons.home_outlined), title: Text("Inicio")),
              BottomBarItem(icon: Icon(Icons.calendar_today_outlined), title: Text("Página 2")),
              BottomBarItem(icon: Icon(Icons.map_outlined), title: Text("Página 3")),
            ],
          ),
        );
  }

 }
