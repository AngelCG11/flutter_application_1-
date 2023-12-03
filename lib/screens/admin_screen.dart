import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../data/movie_data.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController directorController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController synopsisController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  void _addMovie() {
    Movie newMovie = Movie(
      title: titleController.text,
      year: int.parse(yearController.text),
      director: directorController.text,
      genre: genreController.text,
      synopsis: synopsisController.text,
      image: imageController.text,
    );

    
    movies.add(newMovie);

    
    _clearControllers();
  }

  void _deleteMovie(int index) {
    
    movies.removeAt(index);

    
    _clearControllers();
  }

  void _clearControllers() {
    titleController.clear();
    yearController.clear();
    directorController.clear();
    genreController.clear();
    synopsisController.clear();
    imageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Administración de Películas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Título')),
            TextField(controller: yearController, decoration: InputDecoration(labelText: 'Año')),
            TextField(controller: directorController, decoration: InputDecoration(labelText: 'Director')),
            TextField(controller: genreController, decoration: InputDecoration(labelText: 'Género')),
            TextField(controller: synopsisController, decoration: InputDecoration(labelText: 'Sinopsis')),
            TextField(controller: imageController, decoration: InputDecoration(labelText: 'URL de la Imagen')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addMovie,
              child: Text('Agregar Película'),
            ),
            SizedBox(height: 16),
            Text('Catálogo de Películas:'),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  Movie movie = movies[index];
                  return ListTile(
                    title: Text(movie.title),
                    subtitle: Text(movie.year.toString()),
                    trailing: ElevatedButton(
                      onPressed: () {
                        _deleteMovie(index);
                      },
                      child: Text('Eliminar'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
