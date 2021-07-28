part of 'type_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TypeObjToJson(TypeObj instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};

TypeObj _$TypeObjFromJson(Map<String, dynamic> json) {
  return TypeObj(
    name:  json['name'] as String,
    url:  json['url'] as String,
  );

}
