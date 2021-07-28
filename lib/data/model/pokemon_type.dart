import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapp/data/model/type_obj.dart';

part 'pokemon_type.g.dart';

@JsonSerializable()
class PokemonType{
    int slot;
    TypeObj type;


    PokemonType({this.slot, this.type });

    factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);

    Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}
