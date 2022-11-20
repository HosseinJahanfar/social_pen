import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:social_pen/my_colors.dart';
import 'package:social_pen/view/main_screen.dart';
import 'package:social_pen/view/my_cats.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
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
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(width: 2),
              ),
              filled: true,
              fillColor: Colors.white),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return textTheme.headline1;
              }
              return textTheme.subtitle1;
            }), backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.seeMore;
              }
              return SolidColors.primeryColor;
            })),
          ),
          fontFamily: 'dana',
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: SolidColors.posterTitle),
            headline2: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w300),
            headline3: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: SolidColors.seeMore),
            headline4: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 70, 70, 70)),
            headline5: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: SolidColors.hintText),
            bodyText1: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            subtitle1: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: SolidColors.posterSubTitle),
          )),
      home:
          // const SplashScreen(),
          const MainScreen(),
    );
  }
}
