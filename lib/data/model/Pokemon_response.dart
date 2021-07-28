import 'package:json_annotation/json_annotation.dart';
import 'pokemon_model.dart';


@JsonSerializable()
class PokemonResponse{
  int count;
  String next;
  String previous;
  List<PokemonModel> results;

  PokemonResponse({this.count,this.next,this.previous,this.results});


  PokemonResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<PokemonModel>();
      json['results'].forEach((v) {
        results.add(new PokemonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}