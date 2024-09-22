import 'package:flutter/material.dart';
import 'package:namer_app/screens/favorites/favorites_screen.dart';
import 'package:namer_app/screens/generator/generator_screen.dart';
import 'package:namer_app/screens/home/widgets/favorites_icon.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(final BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
      case 1:
        page = const FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Scaffold(
      body: Row(
        children: <Widget>[
          SafeArea(
            child: NavigationRail(
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(
                    Icons.home,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: const Text('Home'),
                ),
                const NavigationRailDestination(
                  icon: FavoritesIcon(),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (final int value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}
