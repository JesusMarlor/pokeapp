import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapp/data/model/pokemon_type.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel{
    String name;
    String type;
    String url;
    List<PokemonType> types;

    PokemonModel({this.name, this.type, this.url, this.types });

    factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);

    Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}