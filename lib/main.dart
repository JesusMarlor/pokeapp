import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokeapp/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'MainProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProvider>(
            create: (_) =>
                MainProvider()),
      ],
      child: Consumer<MainProvider>(
          builder: ( context, provider, _){
            return MaterialApp(
              title: 'FlutterTest',
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            );
          }
      ),
    );
  }
}

