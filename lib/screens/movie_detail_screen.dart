import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles de la Película')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Título: ${movie.title}'),
            Text('Año: ${movie.year}'),
            Text('Director: ${movie.director}'),
            Text('Género: ${movie.genre}'),
            Text('Sinopsis: ${movie.synopsis}'),
            Image.network(movie.image),
          ],
        ),
      ),
    );
  }
}
