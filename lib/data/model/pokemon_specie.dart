import 'dart:ui';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_specie.g.dart';

@JsonSerializable()
class PokemonSpecie{

    Map<String,dynamic> color;
    List<Map<String,dynamic>> flavorTextEntries;
    /*
    {flavor_text: "Whenever PIKACHU comes across something new, it blasts it with a jolt of electricity.If you come across a blackened berry, it’s evidence that this POKéMON mistook the intensity of its charge.",
      language: {
        name: "en",
        url: "https://pokeapi.co/api/v2/language/9/"
      },
      version: {
        name: "ruby",
        url: "https://pokeapi.co/api/v2/version/7/"
      }
    }*/
    List<Map<String,dynamic>> genera;
    /*{
      genus: "Mouse Pokémon",
      language: {
          name: "en",
          url: "https://pokeapi.co/api/v2/language/9/"
        }
      },*/

    String descripcion;
    String category;

    PokemonSpecie({this.color, this.flavorTextEntries,this.genera, this.descripcion, this.category});


    factory PokemonSpecie.fromJson(Map<String, dynamic> json) => _$PokemonSpecieFromJson(json);

    Map<String, dynamic> toJson() => _$PokemonSpecieToJson(this);
}