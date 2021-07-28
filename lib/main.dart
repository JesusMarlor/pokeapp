import 'package:flutter/material.dart';
import 'package:pokeapp/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'MainProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProvider>(
            create: (_) =>
                MainProvider()),
      ],
      child: Consumer<MainProvider>(
          builder: ( context, provider, _){
            return MaterialApp(
              title: 'PokeApp',
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            );
          }
      ),
    );
  }
}

