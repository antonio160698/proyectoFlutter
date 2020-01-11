import 'package:La_aplicacion/class/Post.dart';
import 'package:La_aplicacion/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(home: Conexion()));

class Conexion extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Api")
      ),
      body: miprueba(),
    );
  }

}

class miprueba extends StatelessWidget{
  String url = "https://jsonplaceholder.typicode.com/posts/1";
  final Future<Post> post = null;
  Post datos = new Post();


  Future<Post> pedirdatos() async{
    var response = await http.get(url);
    if(response.statusCode == 200){
      datos = Post.fromJson(json.decode(response.body));
      print(datos.userId);
      return datos;
    }else{
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child:
      Column(
        children:<Widget>[
          Text(datos.title.toString()),
        RaisedButton(
        child: Text("Obtener datos"),
        onPressed: pedirdatos,
      ),
    ]
      ),
    );
  }
}


