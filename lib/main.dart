// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_player/models/playlist_Provider.dart';
import 'package:music_player/pages/home_page.dart';
import 'package:music_player/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
    // ChangeNotifierProvider(create: (context)=> ThemeProvider()),
    ChangeNotifierProvider(create: (context)=> ThemeProvider()),
    ChangeNotifierProvider(create: (context)=> PlaylistProvider()),
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
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // theme: darkMode,
      theme: Provider.of<ThemeProvider>(context).themeData,
      // theme: ThemeData(
      //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
    );
  }
}
