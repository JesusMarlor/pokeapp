part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  print("Type data: ${json['weight'].runtimeType}");
  return PokemonModel(
      name: json['name'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
      weight: json['weight'] != null ? json['weight'].runtimeType == int  ? json['weight'] + 0.0 : json['weight'] : 0.0,
      height: json['height'] != null ? json['height'].runtimeType == int  ? json['height'] + 0.0 : json['height'] : 0.0,

    abilities : (json['abilities'] as List<dynamic>)?.map((e) => e as Map<String, dynamic>)?.toList(),
    stats : (json['stats'] as List<dynamic>)?.map((e) => e as Map<String, dynamic>)?.toList(),

      types: (json['types'] as List<dynamic>)?.map((e){
        print("e: $e");
        return e == null ? null : PokemonType.fromJson(e as Map<String, dynamic>);
      })?.toList(),
  );
}

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'url': instance.url,
};

