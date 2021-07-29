import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../data/Utils/Utils.dart';
import '../../presentation/PantallaUno/PokemonCard/pokemon_card.dart';
import '../../presentation/ResumenPokemon/resumen_pokemonScreen.dart';
import '../../presentation/Widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../MainProvider.dart';

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
        const Text("CHOOSE YOU POKEMON", style: TextStyle( fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w800)),
        mainProvider.listaPokemons != null && mainProvider.listaPokemons.isNotEmpty ?
        Expanded(
          child: RefreshIndicator(
            onRefresh: ()=> mainProvider.getAllPokemons(true),
            child: ListView.builder(
                controller: scrollController,
                itemCount: mainProvider.listaPokemons.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: (){
                        print("open new screen");
                        final parts = mainProvider.listaPokemons[index].url.split('/');
                        mainProvider.listaPokemons[index].id = parts[6];
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>  ResumenPokemonScreen( pokemonModel : mainProvider.listaPokemons[index] )));
                        //mainProvider.mostrarResumen(context, index);
                      },
                      child: PokemonCard( pokemon: mainProvider.listaPokemons[index] )
                  );
                }
            ),
          )
        ) : Center(child: Loading( tipo_progress: Constantes.CODE_PROGRESS_BUSCANDO, titleTxt: "Buscando, espere un momento..", subTxt: "",))
      ],
    );
  }

 }
