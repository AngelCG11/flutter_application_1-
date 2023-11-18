import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido a Mi Aplicación'),
        ),
        body: FutureBuilder(
          future: fetchPokemon(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(
                  'Nombre del Pokémon: ${snapshot.data['name']}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
  Future<Map<String, dynamic>> fetchPokemon() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/charmander'));


    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}
