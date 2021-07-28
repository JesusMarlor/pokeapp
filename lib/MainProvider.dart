
import 'package:flutter/material.dart';
import 'package:pokeapp/data/Utils/Utils.dart';
import 'package:pokeapp/data/model/pokemon_model.dart';
import 'package:pokeapp/repository/pokemon_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainProvider extends ChangeNotifier  {

  bool isDarkMode = false;
  PageController pageController = PageController( initialPage:  0 );
  int selectedTabIndex = 0;
  PokemonRepository pokemonRepository = PokemonRepository();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  List<PokemonModel> lista_pokemons = [];
  bool loading = false;

  void onThemeUpdated( bool isDark ){
    isDarkMode = isDark;
    print("onThemeUpdated: $isDarkMode");
    notifyListeners();
  }


  void selectTab( int index ){
    selectedTabIndex = index > 2 || index < 0 ? 0 : index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  Future<void> getAllPokemons( bool reiniciar ) async {
    print("======>getAllPokemons");
    try {
      if( reiniciar ){
        lista_pokemons.clear();
      }
      final pokemons = await this.pokemonRepository.fetchPokemons();
      print("==>pokemons length: ${pokemons.length}");
      lista_pokemons.addAll(pokemons);

      lista_pokemons.forEach((element) {
        element.type = Utils.getType(element.name);
      });
      refreshController.refreshCompleted();
      refreshController.loadComplete();
      notifyListeners();
    } catch (error) {
      print(error);
    }

  }

  Future<void> getOnePokemon( String id ) async{
    print("====>getOnePokemon");
    try {
      final pokemons = await this.pokemonRepository.fetchResumenPokemon( id );
      print( pokemons );
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}