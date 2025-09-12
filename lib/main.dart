import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ouchie Snuggles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2659BF)),
        textTheme: GoogleFonts.cherryBombOneTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
