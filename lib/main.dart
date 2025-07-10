import 'package:Hotelino/core/theme/app_theme.dart';
import 'package:Hotelino/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  //for trust compiled ui for multiprovider
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();


  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider(WidgetsBinding.instance.platformDispatcher.platformBrightness))//get uI Theme now dark or white
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver { // widgetbinding is mixin and allow me to add sth
  
  //for listen os and if dark , program to dark 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }


  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of<ThemeProvider>(context , listen: false).updateBrightness(brightness);
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(
      builder:(context, themeModeProvider, child) {
        return MaterialApp(
          theme: themeModeProvider.brightness == Brightness.light ? AppTheme.lightTheme : AppTheme.darkTheme,
        home: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: ElevatedButton(onPressed: () {themeModeProvider.toggleTheme();} , 
            child: Text("change theme")),
          ),
        ),
      );
      },
    );
  }
}

