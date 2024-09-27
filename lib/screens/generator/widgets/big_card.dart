import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatefulWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  State<BigCard> createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _fadeIn();
  }

  void _fadeIn() {
    setState(() {
      _opacity = 0.0;
    });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }


  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: _opacity,
            child: MergeSemantics(
              child: Wrap(
                children: <Widget>[
                  Text(
                    widget.pair.first.capitalize(),
                    style: style.copyWith(fontWeight: FontWeight.w100),
                  ),
                  Text(
                    widget.pair.second.capitalize(),
                    style: style.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
