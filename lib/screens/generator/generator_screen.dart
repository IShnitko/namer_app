import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screens/generator/widgets/big_card.dart';
import 'package:namer_app/screens/generator/widgets/history_chart.dart';
import 'package:namer_app/state/app_state.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {


  @override
  Widget build(final BuildContext context) {
    final AppState appState = AppStateScope.of(context);
    final WordPair pair = appState.current;
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Expanded(
            flex: 2,
            child: HistoryChart(),
          ),
          BigCard(pair: pair,),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: AppStateWidget.of(context).toggleFavorite,
                icon: Icon(icon),
                label: const Text('Like'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  AppStateWidget
                      .of(context)
                      .getNext();
                },
                child: const Text('Next'),
              ),
            ],
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
