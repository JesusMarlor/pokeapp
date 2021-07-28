
import 'package:flutter/material.dart';
import '../../../data/model/pokemon_model.dart';

class PokemonCard extends StatelessWidget{

  final PokemonModel pokemon;

  const PokemonCard({
    Key key,
    this.pokemon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
        margin: const EdgeInsets.symmetric( vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( pokemon?.name != null ? pokemon?.name : "", style: TextStyle( fontSize: 35 ) ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [ Icon( Icons.whatshot ), SizedBox( width: 10 ),  Text( pokemon?.type != null ? pokemon?.type : "", style: TextStyle( fontSize: 11 ) )],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only( right: 5),
                width: MediaQuery.of(context).size.height * .18,
                child: Image.asset("assets/pokebola.png"),
              )
            )
          ],
        ),
      );
  }

}