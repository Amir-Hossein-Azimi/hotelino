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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {}
}

