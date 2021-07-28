part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  return PokemonModel(
    name: json['name'],
    type: json['type'],
    url: json['url'],
      types: (json['Temporadas'] as List)
          ?.map((e) =>
      e == null ? null : PokemonType.fromJson(e as Map<String, dynamic>))
  );
}

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'url': instance.url,
};

