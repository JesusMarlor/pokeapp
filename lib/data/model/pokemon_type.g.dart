part of 'pokemon_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) {
  return PokemonType(
    slot:  json['slot'] as int,
    type: TypeObj.fromJson(json["type"]),
  );
}

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) => <String, dynamic>{
  'slot': instance.slot,
  'type': instance.type,
};

