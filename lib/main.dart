import 'package:art_box/providers/artprovider.dart';
import 'package:art_box/screens/startScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ArtProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white, size: 30),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
            color: Color.fromARGB(156, 2, 106, 157),
            elevation: 10),
        scaffoldBackgroundColor: const Color.fromARGB(156, 2, 106, 157),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStatePropertyAll(10),
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(249, 107, 213, 243)),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "ART FOX",
      home: const StartScreen(),
    );
  }
}
