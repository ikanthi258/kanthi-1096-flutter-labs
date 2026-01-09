// ============================================
// A custom widget QuoteContainerCard
//
// AI DOCUMENTATION
// Use AI only searching some syntax for text condition such as
// (movie.rating > 8.0
//               ? 'This is a highly rated movie!'
//               : (movie.rating < 6.0
//                     ? 'This movie might need improvement'
//                     : 'This is a good movie')).
//
// This code showing movie lists by using ListView and allow user
// to interact with movie panel by tap on it, and Snackbar will appear
// at bottom of the screen buy condition of rating score.
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2026-01-09
// ============================================

import 'package:flutter/material.dart';
import 'models/movie_model.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: MainMovies(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MainMovies extends StatelessWidget {
  const MainMovies({super.key});

  void _handleMovieTap(BuildContext context, Movie movie) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          (movie.rating > 8.0
              ? 'This is a highly rated movie!'
              : (movie.rating < 6.0
                    ? 'This movie might need improvement'
                    : 'This is a good movie')),
        ),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = [
      const Movie(
        title: "The Shawshank Redemption",
        year: 1994,
        genre: "Drama",
        director: "Frank Darabont",
        rating: 9.3,
      ),
      const Movie(
        title: "Inception",
        year: 2010,
        genre: "Sci-Fi",
        director: "Christopher Nolan",
        rating: 7.8,
      ),
      const Movie(
        title: "Disaster Movie",
        year: 2008,
        genre: "Comedy",
        director: "Jason Friedberg",
        rating: 1.9,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Movie Lists')),
      body: ListView(
        children: movies.map((movie) {
          return ListTile(
            leading: Icon(
              Icons.movie,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              movie.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${movie.year} · ${movie.genre} \nDirector: ${movie.director}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // important for ListTile trailing
              children: [
                Icon(
                  Icons.star,
                  color: (movie.rating >= 7.0
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                const SizedBox(width: 4),
                Text(
                  movie.rating.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: (movie.rating >= 7.0
                        ? FontWeight.bold
                        : FontWeight.normal),
                    color: (movie.rating >= 7.0
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ),
              ],
            ),
            onTap: () => _handleMovieTap(context, movie),
          );
        }).toList(),
      ),
    );
  }
}
