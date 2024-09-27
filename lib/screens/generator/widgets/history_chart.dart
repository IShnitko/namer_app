import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/state/app_state.dart';

class HistoryChart extends StatefulWidget {
  const HistoryChart({super.key});

  @override
  State<HistoryChart> createState() => _HistoryChartState();
}

class _HistoryChartState extends State<HistoryChart> {
  final GlobalKey<State<StatefulWidget>> _key = GlobalKey();

  static const Gradient _gradient = LinearGradient(
    colors: <Color>[Colors.transparent, Colors.black],
    stops: <double>[0, 0.7],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(final BuildContext context) {
    final AppState appState = AppStateScope.of(context)
      ..historyListKey = _key;
    return ShaderMask(
      shaderCallback: (final Rect bounds) => _gradient.createShader(bounds),
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true,
        initialItemCount: appState.historyList.length,
        itemBuilder: (
            final BuildContext context,
            final int index,
            final Animation<double> animation,
            ) {
          final WordPair pair = appState.historyList[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  AppStateWidget.of(context).toggleFavorite(pair);
                },
                icon: appState.favorites.contains(pair)
                    ? const Icon(Icons.favorite, size: 12)
                    : const SizedBox(),
                label: Wrap(
                  children: <Widget>[
                    Text(
                      pair.first.capitalize(),
                    ),
                    Text(
                      pair.second.capitalize(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
