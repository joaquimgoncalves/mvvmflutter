import 'package:arquitetur_mvvm/entidades/rotas.dart';
import 'package:arquitetur_mvvm/paginas/formulario-aluno/formulario-aluno-view.dart';
import 'package:arquitetur_mvvm/paginas/listagem-aluno/listagem-aluno-view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arquitetura MVVM',
      theme: ThemeData(       
        primarySwatch: Colors.blue,      
      ),
      home: ListagemAlunoPage(),
      routes: <String, WidgetBuilder> { //5
        Rotas.listagemAluno: (BuildContext context) => new ListagemAlunoPage(), //6
        Rotas.formularioAluno: (BuildContext context) => new FormularioAlunoPage() //7
      },
    );
  }
}