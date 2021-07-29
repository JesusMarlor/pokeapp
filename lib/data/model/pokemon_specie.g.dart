part of 'pokemon_specie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpecie _$PokemonSpecieFromJson(Map<String, dynamic> json) {
  return PokemonSpecie(
      color : json["color"] as Map<String,dynamic>,
      flavorTextEntries : (json['flavor_text_entries'] as List<dynamic>)?.map((e) => e as Map<String, dynamic>)?.toList(),
      genera : (json['genera'] as List<dynamic>)?.map((e) => e as Map<String, dynamic>)?.toList(),
  );
}

Map<String, dynamic> _$PokemonSpecieToJson(PokemonSpecie instance) => <String, dynamic>{
  'color': instance.color,
  'flavor_text_entries': instance.flavorTextEntries,
  'genera': instance.genera,
};

