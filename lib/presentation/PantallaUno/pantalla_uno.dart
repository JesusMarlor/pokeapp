import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pokeapp/data/Utils/Utils.dart';
import 'package:pokeapp/presentation/PantallaUno/PokemonCard/PokemonCard.dart';
import 'package:pokeapp/presentation/Widgets/Loading.dart';
import 'package:provider/provider.dart';
import '../../MainProvider.dart';
import '../../data/model/pokemon_model.dart';

///acostumbro a poner el sufijo Screen para indicar que la clase se refiere a una pantalla
///en este caso es redundante pero solo es por fines practivos
class PantallaUnoScreen extends StatefulWidget {

  const PantallaUnoScreen({Key key}) : super(key: key);

  @override
  _PantallaUnoScreenState createState( ) => _PantallaUnoScreenState();
}

class  _PantallaUnoScreenState extends State<PantallaUnoScreen>{

  final scrollController = ScrollController();
  bool scrollSwitch = true, primeraBusqueda = true;
  MainProvider mainProvider;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async{

    });
    initListenScroll();
    super.initState();
  }

  void initListenScroll(){
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200 &&
          scrollSwitch == true) {
        scrollSwitch = false;
        //buscar mas pokemons
      }
    });
  }



  @override
  Widget build(BuildContext context){

    mainProvider = Provider.of<MainProvider>(context, listen: true);
    if( primeraBusqueda ){
      primeraBusqueda = false;
      mainProvider.getAllPokemons( true );
      //mainProvider.getOnePokemon( "1" );
    }
    return Column(
      children: [
        const SizedBox(height: 50,),
        const Text("CHOOSE YOU POKEMON", style: TextStyle( fontSize: 25, color: Colors.grey)),
        mainProvider.lista_pokemons != null && mainProvider.lista_pokemons.isNotEmpty ?
        Expanded(
          child: RefreshIndicator(
            onRefresh: ()=> mainProvider.getAllPokemons(true),
            child: ListView.builder(
                controller: scrollController,
                itemCount: mainProvider.lista_pokemons.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: (){
                        print("open new screen");
                      },
                      child: PokemonCard( pokemon: mainProvider.lista_pokemons[index] )
                  );
                }
            ),
          )
        ) : Loading( tipo_progress: Constantes.CODE_PROGRESS_BUSCANDO, titleTxt: "Buscando, espere un momento..", subTxt: "",)
      ],
    );
  }

 }
