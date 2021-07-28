
import 'dart:ui';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel{
    int id;
    String name;
    String type;
    String url;

    PokemonModel({this.id, this.name, this.type, this.url });

    factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);

    Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}