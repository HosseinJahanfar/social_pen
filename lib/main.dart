import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:social_pen/gen/assets.gen.dart';
import 'package:social_pen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // Persian,Iran
      ],
      theme: ThemeData(
          fontFamily: 'dana',
          textTheme: const TextTheme(
              headline1: TextStyle(),
              headline2: TextStyle(),
              headline3: TextStyle(),
              headline4: TextStyle(),
              bodyText1: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 70, 70, 70),
                  fontWeight: FontWeight.w700))),
      home: const SplashScreen(),
    );
  }
}
