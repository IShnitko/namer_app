import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screens/favorites/widgets/format_date.dart';
import 'package:namer_app/state/app_state.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final GlobalKey<State<StatefulWidget>> _key = GlobalKey();

  Future<void> _handleStretchTrigger() async {
    // Simulate a delay
    final Future<void> delayed = Future.delayed(const Duration(seconds: 1));
    await delayed;
    // Rebuild the page by updating the state
    setState(() {});

  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AppState appState = AppStateScope.of(context)
      ..favoritesListKey = _key;
    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet'),
      );
    }
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          stretch: true,
          onStretchTrigger: _handleStretchTrigger,
          expandedHeight: 200,
          // title: Text("You have ${appState.favorites.length} favorites"),
          backgroundColor: theme.primaryColor,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const <StretchMode>[
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
            ],
            // collapseMode: CollapseMode.parallax,
            title: Text(
              'You have ${appState.favorites.length} favorites',
              style:
                  theme.textTheme.titleLarge!.copyWith(color: theme.cardColor),
            ),
            background: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: <Color>[theme.primaryColor, Colors.transparent],
                ),
              ),
              child: Image.asset(
                'assets/images/library.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: true,
        ),
        SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverAnimatedList(
              key: _key,
              itemBuilder: (final BuildContext context, final int index,
                  final Animation<double> animation,) {
                final WordPair pair = appState.favorites[index];
                return _buildListTile(context, index, animation, pair);
              },
            ),),
      ],
    );
  }

  Widget _buildListTile(final BuildContext context, final int index,
      final Animation<double> animation, final WordPair pair,) {
    final AppState appState = AppStateScope.of(context);
    final ThemeData theme = Theme.of(context);
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () {
          AppStateWidget.of(context).removeFavorite(pair);
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(pair.asPascalCase),
          Text(
            formatDate(appState.timingList[index]),
            style: theme.textTheme.displayLarge!
                .copyWith(color: Colors.black45, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
