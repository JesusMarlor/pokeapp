import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pokeapp/presentation/PantallaUno/PokemonCard/PokemonCard.dart';
import '../../data/model/pokemon_model.dart';

///acostumbro a poner el sufijo Screen para indicar que la clase se refiere a una pantalla
///en este caso es redundante pero solo es por fines practivos
class PantallaUnoScreen extends StatefulWidget {

  const PantallaUnoScreen({Key key}) : super(key: key);

  @override
  _PantallaUnoScreenState createState( ) => _PantallaUnoScreenState();
}

class  _PantallaUnoScreenState extends State<PantallaUnoScreen>{

  List<PokemonModel> lista_pokemons = [
    PokemonModel( name: "Pikachu", type: "Electric", url : "https://pokeapi.co/api/v2/pokemon/1/"),
    PokemonModel( name: "Squirtle", type: "Water", url : "https://pokeapi.co/api/v2/pokemon/1/"),
    PokemonModel( name: "Charmander", type: "Fire", url : "https://pokeapi.co/api/v2/pokemon/1/"),
    PokemonModel( name: "Bulbasaur", type: "Grass", url : "https://pokeapi.co/api/v2/pokemon/1/"),
    PokemonModel( name: "Bulbasaur", type: "Grass", url : "https://pokeapi.co/api/v2/pokemon/1/"),
    PokemonModel( name: "Bulbasaur", type: "Grass", url : "https://pokeapi.co/api/v2/pokemon/1/"),
  ];

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      //search data
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const SizedBox(height: 50,),
        const Text("CHOOSE YOU POKEMON", style: TextStyle( fontSize: 25, color: Colors.grey)),
        Expanded(
          child: ListView.builder(
              itemCount: lista_pokemons.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    print("open new screen");
                  },
                  child: PokemonCard( pokemon: lista_pokemons[index] )
                );
              }
          ),
        )
      ],
    );
  }

 }
