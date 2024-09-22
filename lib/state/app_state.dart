import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppState {
  GlobalKey? historyListKey;
  GlobalKey? favoritesListKey;
  WordPair current = WordPair.random();
  List<WordPair> historyList = <WordPair>[];
  List<WordPair> favorites = <WordPair>[];
  List<DateTime> timingList = <DateTime>[];

  AppState copyWith({
    final GlobalKey? historyListKey,
    final GlobalKey? favoritesListKey,
    final WordPair? current,
    final List<WordPair>? historyList,
    final List<WordPair>? favorites,
    final List<DateTime>? timingList,
  }) {
    return AppState()
      ..historyListKey = historyListKey ?? this.historyListKey
      ..favoritesListKey = favoritesListKey ?? this.favoritesListKey
      ..current = current ?? this.current
      ..historyList = historyList ?? this.historyList
      ..favorites = favorites ?? this.favorites
      ..timingList = timingList ?? this.timingList;
  }
}

class AppStateScope extends InheritedWidget {
  const AppStateScope({
    required this.data,
    super.key,
    required super.child,
  });

  final AppState data;

  static AppState of(final BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(final AppStateScope oldWidget) {
    return data == oldWidget.data;
  }
}

class AppStateWidget extends StatefulWidget {
  const AppStateWidget({required this.child, super.key});

  final Widget child;

  static AppStateWidgetState of(final BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState data = AppState();

  void getNext() {
    setState(() {
      data.historyList.insert(0, data.current);
      final AnimatedListState? animatedList =
      data.historyListKey?.currentState as AnimatedListState?;
      animatedList?.insertItem(0);
      data.current = WordPair.random();
    });
  }

  void toggleFavorite([WordPair? pair]) {
    setState(() {
      pair = pair ?? data.current;
      final DateTime now = DateTime.now();
      if (data.favorites.contains(pair)) {
        removeFavorite(pair!);
      } else {
        data.favorites.add(pair!);
        data.timingList.add(now);
      }
    });
  }

  void  removeFavorite(final WordPair pair) {
    setState(() {
      data.timingList.removeAt(data.favorites.indexOf(pair));
      data.favorites.remove(pair);
    });
  }

  @override
  Widget build(final BuildContext context) {
    return AppStateScope(
      data: data,
      child: widget.child,
    );
  }
}
