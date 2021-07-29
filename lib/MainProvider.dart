
import 'package:flutter/material.dart';
import 'package:pokeapp/data/Utils/Utils.dart';
import 'package:pokeapp/data/model/pokemon_model.dart';
import 'package:pokeapp/data/model/pokemon_specie.dart';
import 'package:pokeapp/presentation/ResumenPokemon/resumen_pokemonScreen.dart';
import 'package:pokeapp/repository/pokemon_repository.dart';

class MainProvider extends ChangeNotifier  {

  bool isDarkMode = false;
  PageController pageController = PageController( initialPage:  0 );
  int selectedTabIndex = 0;
  PokemonRepository pokemonRepository = PokemonRepository();
  List<PokemonModel> listaPokemons = [];
  bool loading = false;
  PokemonModel pokemonModel;
  PokemonSpecie pokemonSpecie;
  TypeData typeData;

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
        listaPokemons.clear();
      }
      final pokemons = await this.pokemonRepository.fetchPokemons();
      listaPokemons.addAll(pokemons);
      listaPokemons.forEach((element) {
        element.type = Utils.getType(element.name);
      });
      notifyListeners();
    } catch (error) {
      print(error);
    }

  }

  Future<void> getOnePokemon( String id, bool buscarSpecie ) async{
    print("======>getOnePokemon");
    try {
      pokemonModel = await this.pokemonRepository.fetchResumenPokemon( id );
      print( pokemonModel.name );
      if( pokemonModel.type == null ) {
        if( pokemonModel.types != null && pokemonModel.types.isNotEmpty ){
          pokemonModel.type = pokemonModel.types.first.type.name;
          typeData = Utils.getDataType(pokemonModel.type);
        }
      }
      List<String> listTemp = [];
      pokemonModel.abilities.forEach((element) {listTemp.add(element["ability"]["name"]);});
      pokemonModel.abilitiesString = listTemp.join(", ");
      notifyListeners();
      if( buscarSpecie ) {
        getPokemonSpecie(id);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<PokemonSpecie> getPokemonSpecie( String id ) async {
    print("======>getPokemonSpecie");
    try {
      pokemonSpecie = await this.pokemonRepository.fetchPokemonSpecies( id );
      Map<String,dynamic> category = pokemonSpecie.genera.firstWhere((element) => element["language"]["name"] == "en" );
      Map<String,dynamic> flavor   = pokemonSpecie.flavorTextEntries.firstWhere((element) => element["language"]["name"] == "en" && element["version"]["name"] == "ruby" );
      pokemonSpecie.category = category["genus"];
      pokemonSpecie.descripcion = flavor["flavor_text"];
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  //si quisiera primero buscar toda la informacion y luego mostrar la pantalla
  //se ve mejor pero el usuario puede sentir que es más lento
  //se le tendria  que poner un progress a modo de dialog pero se pierde el hero
  void mostrarResumen( BuildContext context, int index ) async{
    await getOnePokemon( listaPokemons[index].id, false );
    await getPokemonSpecie(listaPokemons[index].id );
    Navigator.push(context, MaterialPageRoute(builder: (_)=>  ResumenPokemonScreen( pokemonModel : listaPokemons[index] )));
  }

  void reiniciarValores(){
    pokemonSpecie = null;
    pokemonModel  = null;
    typeData      = null;
    notifyListeners();
  }
}

