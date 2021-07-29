import 'package:json_annotation/json_annotation.dart';

part 'type_obj.g.dart';


@JsonSerializable()
class TypeObj{
  String name;
  String url;

  TypeObj({this.name, this.url });

  factory TypeObj.fromJson(Map<String, dynamic> json) => _$TypeObjFromJson(json);

  Map<String, dynamic> toJson() => _$TypeObjToJson(this);

}