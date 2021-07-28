
import 'package:flutter/material.dart';
import 'package:pokeapp/data/Utils/Utils.dart';
import 'package:pokeapp/data/model/pokemon_type.dart';
import '../../../data/model/pokemon_model.dart';

class PokemonCard extends StatelessWidget{

  final PokemonModel pokemon;

  const PokemonCard({
    Key key,
    this.pokemon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chunks = pokemon.url.split('/');
    var imageId = chunks[6];
    final TypeData pokemonType = Utils.getDataType(pokemon.type);
    final double height = MediaQuery.of(context).size.height * .2;
    return  Container(
      height: height,
      child: Card(
        elevation: 5,
          margin: const EdgeInsets.symmetric( vertical: 10, horizontal: 20),
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///AJUSTAR EL TEXTO SOLO SI EL NOMBRE ES MUY LARGO
                      if (pokemon.name.length == 10) SizedBox(
                        width:  MediaQuery.of(context).size.width *  .48,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text( pokemon?.name != null ? Utils.capitalize(pokemon?.name) : "",
                                style:  TextStyle( fontSize: 40, color: pokemonType != null ? pokemonType.primaryColor : Colors.black )
                          )
                        ),
                      ) else Text( pokemon?.name != null ? Utils.capitalize(pokemon?.name) : "",
                          style:  TextStyle( fontSize: 40, color: pokemonType != null ? pokemonType.primaryColor : Colors.black )
                      ),
                      SizedBox( height: 5 ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          pokemonType.icon != null ? pokemonType.icon : Icon( Icons.whatshot, color: Colors.black  ),
                          SizedBox( width: 5 ),
                          Text( pokemonType != null ? pokemonType.name : "", style: TextStyle( fontSize: 15 ) )
                        ],
                      )
                    ],
                  ),
                ),
              Positioned(
                right: 5,
                top: 0,
                child: Container(
                    height: height+15,
                    width: height,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all( Radius.circular(5.0) ),
                      image: DecorationImage(
                          //image: NetworkImage( 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${imageId}.png'), fit: BoxFit.cover),
                          image: NetworkImage( 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${imageId}.png'), fit: BoxFit.fitHeight),
                    ),
                  ),
              )

            ],
          ),
        ),
    );
  }

}