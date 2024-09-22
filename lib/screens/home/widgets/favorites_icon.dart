import 'package:flutter/material.dart';
import 'package:namer_app/state/app_state.dart';

class FavoritesIcon extends StatelessWidget {
  const FavoritesIcon({super.key});

  @override
  Widget build(final BuildContext context) {
    final AppState appState = AppStateScope.of(context);
    final bool hasFavorites = appState.favorites.isNotEmpty;
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: hasFavorites ? 10 : 0),
            child: Icon(
              Icons.favorite,
              color: Theme.of(context).primaryColor,
            ),
          ),
          if (hasFavorites)
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 6),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                child: Text(
                  appState.favorites.length.toString(),
                  style: const TextStyle(fontSize: 8),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
