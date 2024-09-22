import 'package:flutter/material.dart';
import 'package:namer_app/screens/favorites/favorites_screen.dart';
import 'package:namer_app/screens/generator/generator_screen.dart';
import 'package:namer_app/screens/home/home_screen.dart';

class Routes {
  static const String generator = '/generator';
  static const String favorites = '/favorites';
  static const String home = '/home';

  static Map<String, WidgetBuilder> get all => <String, WidgetBuilder>{
    home: (final BuildContext context) => const MyHomePage(),
    generator: (final BuildContext context) => const GeneratorPage(),
    favorites: (final BuildContext context) => const FavoritesPage(),
  };
}