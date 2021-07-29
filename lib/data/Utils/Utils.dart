import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TypeData{

  Color primaryColor;
  Widget icon;
  String name;

  TypeData({ this.primaryColor, this.icon, this.name  });

}

class Utils{

  static String capitalize( String cadena ){
    return cadena[0].toUpperCase() + cadena.substring(1);
  }

  ///esta ruta indica los colores https://pokeapi.co/api/v2/pokemon-color/$id
  static TypeData getDataType( String type ){

    switch( type ) {

      case "bug" :
          return TypeData( primaryColor: Color(0xff7e8a18), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.bug, color: Color(0xff7e8a18),) );
        break;

      case "dark" :
        return TypeData( primaryColor: Color(0xff544236), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.moon, color: Color(0xff544236),) );
        break;

      case "dragon" :
        return TypeData( primaryColor: Color(0xff4608dc), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.dragon, color: Color(0xff4608dc),) );
        break;

      case "electric" :
        return TypeData( primaryColor: Color(0xffd7ad07), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.bolt, color: Color(0xffd7ad07),) );
        break;

      case "fairy" :
        return TypeData( primaryColor: Color(0xffe04568), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.hatWizard, color: Color(0xffe04568)) );
        break;

      case "fighting" :
        return TypeData( primaryColor: Color(0xff90241e), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.mitten, color: Color(0xff90241e),) );
        break;

      case "fire" :
        return TypeData( primaryColor: Color(0xfff08030), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.fire, color: Color(0xfff08030),) );
        break;

      case "flying" :
        return TypeData( primaryColor: Color(0xff663be5), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.dove, color: Color(0xff663be5),) );
        break;

      case "grass" :
        return TypeData( primaryColor: Color(0xff57a032), name: capitalize(type), icon : Icon( Icons.grass, color: Color(0xff57a032), ) );
        break;

      case "ghost" :
        return TypeData( primaryColor: Color(0xff544272), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.ghost, color: Color(0xff544272),) );
        break;

      case "ground" :
        return TypeData( primaryColor: Color(0xffcca12a), name: capitalize(type), icon : Icon( Icons.circle, color: Color(0xffcca12a),)  );
        break;

      case "ice" :
        return TypeData( primaryColor: Color(0xff55bfbf), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.icicles, color: Color(0xff55bfbf), )   );
        break;

      case "normal" :
        return TypeData( primaryColor: Color(0xff838355), name: capitalize(type), icon : Icon( Icons.circle, color: Color(0xff838355),) );
        break;

      case "poison" :
        return TypeData( primaryColor: Color(0xffa251a2), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.skull, color: Color(0xffa251a2)) );
        break;

      case "psychic" :
        return TypeData( primaryColor: Color(0xfff20a50), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.atom, color: Color(0xfff20a50),) );
        break;

      case "rock" :
        return TypeData( primaryColor: Color(0xff8a782a), name: capitalize(type), icon : Icon( Icons.circle, color: Color(0xff8a782a),)  );
        break;

      case "steel" :
        return TypeData( primaryColor: Color(0xff7d7da9), name: capitalize(type), icon : Icon( Icons.circle, color: Color(0xff7d7da9),)  );
        break;

      case "water" :
        return TypeData( primaryColor: Color(0xff1a56e8), name: capitalize(type), icon : FaIcon(FontAwesomeIcons.water, color: Color(0xff1a56e8),)  );
        break;

        default :
          return TypeData( primaryColor:  Colors.white, name: capitalize(type), icon : Icon( Icons.circle)  );
        break;
    }

  }

  static String getType( String name ){

    switch( name ) {
      case "bulbasaur" :
      case "ivysaur" :
      case "venusaur" :
        return "grass";
        break;

      case "charmander" :
      case "charmeleon" :
      case "charizard" :
        return "fire";
        break;

      case "squirtle" :
      case "wartortle" :
      case "blastoise" :
        return "water";
        break;

      case "caterpie" :
      case "metapod" :
      case "butterfree" :
      case "weedle" :
      case "kakuna" :
      case "beedrill" :
        return "bug";
        break;

      case "pidgey" :
      case "pidgeotto" :
      case "pidgeot" :
      case "rattata" :
      case "raticate" :
        return "normal";
        break;

      default :
          return "notype";
        break;
    }

  }
}

class Constantes{

  static const  CODE_PROGRESS_BUSCANDO = 0;
  static const  CODE_PROGRESS_NO_RESULTS = 1;

}