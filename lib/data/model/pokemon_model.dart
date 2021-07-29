import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapp/data/model/pokemon_type.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel{
    String id;
    String name;
    String type;
    String url;
    double weight;
    double height;
    List<Map<String,dynamic>> abilities;
    List<Map<String,dynamic>> stats;
    String abilitiesString;
    List<PokemonType> types;

    PokemonModel({this.id,this.name, this.type, this.url, this.weight, this.height, this.abilities, this.stats, this.abilitiesString, this.types });

    factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);

    Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}