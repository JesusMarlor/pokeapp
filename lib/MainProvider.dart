
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier  {

  bool isDarkMode = false;
  PageController pageController = PageController( initialPage:  0 );
  int selectedTabIndex = 0;

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

}