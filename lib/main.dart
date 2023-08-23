import 'package:cosmic/planets_data/appState.dart';
import 'package:cosmic/views/home/home.dart';
import 'package:cosmic/views/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppStateWidget(
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData.light(useMaterial3: true).copyWith(
            visualDensity: VisualDensity.comfortable,
            textTheme: cosmicTextTheme,
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                contentPadding: EdgeInsets.all(20),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                floatingLabelStyle: TextStyle(color: Colors.blueGrey),
                fillColor: Color.fromARGB(255, 32, 32, 30)))),
  ));
}

TextTheme cosmicTextTheme = const TextTheme(
    titleLarge: TextStyle(
        fontFamily: "Figtree",
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    titleMedium: TextStyle(
        fontFamily: "Figtree", fontSize: 24, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(
        fontFamily: "Figtree", fontSize: 16, fontWeight: FontWeight.bold),
    labelMedium:
        TextStyle(fontFamily: "Figtree", fontSize: 12, color: Colors.grey),
    bodyMedium: TextStyle(
      fontFamily: "Figtree",
      fontSize: 12,
      color: Color.fromARGB(255, 241, 233, 233),
    ));
