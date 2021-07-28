part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  return PokemonModel(
    id:  json['id'] != null ? json['id'] as int : 0,
    name: json['name'],
    type: json['type'],
    url: json['url'],
  );
}

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'url': instance.url,
};

