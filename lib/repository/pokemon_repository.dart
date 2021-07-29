
import 'package:pokeapp/data/model/pokemon_specie.dart';

import '../data/model/pokemon_model.dart';
import '../data/network/ApiProvider.dart';

class PokemonRepository {
  ApiProvider apiProvider = ApiProvider();
  List<PokemonModel> pokemons = [];
  int count = 0;

  Future<List<PokemonModel>> fetchPokemons() async {

    print("====>fetchPokemons");
    if (count == 880) return this.pokemons;

    if (this.pokemons.isEmpty) {
      print("this.pokemons.isEmpty");
      this.pokemons.addAll(await apiProvider.fetchPokemons());
      this.count = this.pokemons.length;
      return pokemons;
    }

    print("await apiProvider.fetchPokemons");
    this.pokemons.addAll(await apiProvider.fetchPokemons(offset: this.count));
    this.count = this.pokemons.length;
    return pokemons;
  }

  Future<PokemonModel> fetchResumenPokemon( String id ) async{
    print("===>fetchResumenPokemon");
    PokemonModel _pokemon = await apiProvider.getResumenPokemon(id);
    return _pokemon;
  }

  Future<PokemonSpecie> fetchPokemonSpecies( String id ) async{
    print("===>fetchResumenPokemon");
    PokemonSpecie _pokemon = await apiProvider.getPokemonSpecie(id);
    return _pokemon;
  }

}
