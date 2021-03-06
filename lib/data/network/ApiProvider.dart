

import 'dart:convert';

import 'package:pokeapp/data/model/pokemon_model.dart';
import 'package:pokeapp/data/model/pokemon_specie.dart';

import '../../data/model/pokemon_model.dart';
import '../../data/model/Pokemon_response.dart';

import 'ApiBaseHelper.dart';

class ApiProvider {

  ApiBaseHelper _helper = ApiBaseHelper();

  /* deshabilitando querys dinamicos y fijarlos a 0, 20*/
  Future<List<PokemonModel>> fetchPokemons({int offset = 0, int limit = 20}) async {
    offset=0;
    limit=20;
    print("=====>ApiProvider=====>fetchPokemons");
    final path = 'pokemon?offset=$offset&limit=$limit';
    print("=======>path: $path");
    final responseString = await _helper.get(path);
    final response = PokemonResponse.fromJson(responseString).results;

    ///si quisiera tomar el color del texto desde el array de types
    ///tendria que consultar el resumen de cada uno de los pokemon
    ///eso genera uno tiempo de espera y no es optimo
    /*await Stream.fromIterable((response)
        .take(20))
        .asyncMap(( element ) async {
          final chunks = element.url.split('/');
          var id = chunks[6];
          this.getResumenPokemon( id );
          PokemonModel _pokemon = await getResumenPokemon( id );
          element.types = _pokemon.types;
        }).toList();*/
    return response;
  }

  Future<PokemonModel> getResumenPokemon( String id ) async{
    print("====>getResumenPokemon");
    final path = 'pokemon/$id';
    final responseString = await _helper.get(path);
    final response = PokemonModel.fromJson( responseString );
    print( response );
    return response;
  }

  Future<PokemonSpecie> getPokemonSpecie( String id ) async{
    print("====>getResumenPokemon");
    final path = 'pokemon-species/$id';
    final responseString = await _helper.get(path);
    final response = PokemonSpecie.fromJson( responseString );
    print( response );
    return response;
  }

}