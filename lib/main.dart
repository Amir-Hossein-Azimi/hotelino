import 'package:Hotelino/bootstrap.dart';
import 'package:Hotelino/core/theme/app_theme.dart';
import 'package:Hotelino/core/theme/theme_provider.dart';
import 'package:Hotelino/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:Hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:Hotelino/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {

  //for trust compiled ui for multiprovider
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //config , and ... when in splash screen 
  await lazyBootstrap();
  FlutterNativeSplash.remove();


  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider(WidgetsBinding.instance.platformDispatcher.platformBrightness)),//get uI Theme now dark or white
      ChangeNotifierProvider(create: (_) => OnboardingProvider(OnboardingRepository()))//onboarding page
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
          title: "Hotelino",
          debugShowCheckedModeBanner: false,
          theme: themeModeProvider.brightness == Brightness.light ? AppTheme.lightTheme : AppTheme.darkTheme,
          routes: AppRoute.routes,
          initialRoute: AppRoute.onboarding,
      );
      },
    );
  }
}

