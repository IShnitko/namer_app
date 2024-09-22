import 'package:flutter/material.dart';
import 'package:namer_app/app/routes.dart';// This will manage your app routes

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(1, 5, 80, 100),
        ),
      ),
      initialRoute: Routes.home,
      routes: Routes.all,
    );
  }
}
