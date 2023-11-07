import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.prismic.io//intuzwebsite/c793931f-7acb-4ec1-90e7-4c8687dec965_Main.png?w=1200&q=75&auto=format,compress&fm=png8'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              'Mi Aplicación',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
