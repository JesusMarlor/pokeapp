import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pokeapp/data/Utils/Utils.dart';
import 'package:pokeapp/data/model/pokemon_model.dart';
import 'package:pokeapp/presentation/Widgets/loading.dart';
import 'package:provider/provider.dart';

import '../../MainProvider.dart';
import 'Grafica/grafica.dart';

class ResumenPokemonScreen extends StatefulWidget {

  final PokemonModel pokemonModel;

  const ResumenPokemonScreen({Key key, this.pokemonModel}) : super(key: key);

  @override
  _ResumenPokemonScreenState createState( ) => _ResumenPokemonScreenState();
}

class  _ResumenPokemonScreenState extends State<ResumenPokemonScreen> {

  MainProvider mainProvider;
  bool primeraBusqueda = true;

  String id = "0";

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context){

    mainProvider = Provider.of<MainProvider>(context, listen: true);

    if( primeraBusqueda ){
      primeraBusqueda = false;
      final chunks = widget.pokemonModel.url.split('/');
       id = chunks[6];
      mainProvider.getOnePokemon(id, true );
    }

    Future<bool> _onBackPressed() async {
      Navigator.pop( context, true );
      return Future.value(false);
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: mainProvider.pokemonModel == null ?
        Loading( tipo_progress: Constantes.CODE_PROGRESS_BUSCANDO, titleTxt: "Buscando, espere un momento..", subTxt: "" )
            : Stack(
          alignment : AlignmentDirectional.center,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: mainProvider.typeData != null ? mainProvider.typeData.primaryColor : Colors.white,
              ),
              child: SizedBox(),
            ),
            Container(
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width * .90,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xFF3A5160).withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: SizedBox()
            ),
            ///Contenedor principal de informacion
            Container(
              height: MediaQuery.of(context).size.height * .63,
              width: MediaQuery.of(context).size.width * .80,
              padding: const EdgeInsets.symmetric( vertical: 20, horizontal: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width:  MediaQuery.of(context).size.width *  .35,
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text( mainProvider.pokemonModel?.name != null ? Utils.capitalize(mainProvider.pokemonModel?.name) : "",
                            style:  TextStyle( fontSize: 40, color : Colors.black )
                        )
                    ),
                  ),
                  SizedBox( height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      mainProvider.typeData.icon != null ? mainProvider.typeData.icon : Icon( Icons.whatshot, color: Colors.black  ),
                      SizedBox( width: 5 ),
                      Text( mainProvider.typeData != null ? mainProvider.typeData.name : "", style: TextStyle( fontSize: 15 ) )
                    ],
                  ),
                  SizedBox( height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 25,
                        child: Column(
                          children: [
                            Text( "Heigth", style: TextStyle( color: mainProvider.typeData != null ? mainProvider.typeData.primaryColor : Colors.black), ),
                            Text("${mainProvider.pokemonModel?.height} D")
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 25,
                          child: Column(
                            children: [
                              Text( "Weight", style: TextStyle( color: mainProvider.typeData != null ? mainProvider.typeData.primaryColor : Colors.black), ),
                              Text("${mainProvider.pokemonModel?.weight} lbs")
                            ],
                          )
                      ),
                      Expanded(
                        flex: 25,
                        child: Column(
                          children: [
                            Text( "Category", style: TextStyle( color: mainProvider.typeData != null ? mainProvider.typeData.primaryColor : Colors.black), ),
                            mainProvider.pokemonSpecie != null ? Text( mainProvider.pokemonSpecie.category != null ? mainProvider.pokemonSpecie.category : "-") : SizedBox()
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 25,
                          child: Column(
                            children: [
                              Text( "Abilities", style: TextStyle( color: mainProvider.typeData != null ? mainProvider.typeData.primaryColor : Colors.black), ),
                              mainProvider.pokemonModel != null && mainProvider.pokemonModel.abilitiesString != null ?  Text(mainProvider.pokemonModel.abilitiesString) : SizedBox()
                            ],
                          )
                      ),
                    ],
                  ),
                  SizedBox( height: 20 ),
                  mainProvider.pokemonSpecie != null ? Align(
                      alignment: Alignment.center,
                      child: Text( mainProvider.pokemonSpecie != null ? mainProvider.pokemonSpecie.descripcion :"", textAlign: TextAlign.justify)
                  ) : Center( child : CircularProgressIndicator() ),
                  SizedBox(height: 20,),
                  mainProvider.pokemonModel != null && mainProvider.pokemonModel.stats != null ?
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .18, //180
                    width:  300,
                    child: Grafica( lista: mainProvider.pokemonModel.stats, color: mainProvider.typeData.primaryColor, onTap: (){

                    }),
                  )
                  : SizedBox()
                ],
              )
            ),
            widget.pokemonModel != null ? Positioned(
              right: 30,
              top: 100,
              child: Hero(
                tag: "pokemonId${widget.pokemonModel.id}",
                child: Container(
                  height: 190,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all( Radius.circular(5.0) ),
                    image: DecorationImage(
                      //image: NetworkImage( 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${imageId}.png'), fit: BoxFit.cover),
                        image: NetworkImage( 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.pokemonModel.id}.png'), fit: BoxFit.fitHeight),
                  ),
                ),
              ),
            ) : SizedBox(),
            Positioned(
              bottom: 30,
              child: InkWell(
                onTap: _onBackPressed,
                  child: Image.asset("assets/pokebola.png", height: 80, width: 80,)
              )
            )
          ],
        ),
      ),
    );
  }


 }
