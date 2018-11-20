import 'package:arquitetur_mvvm/entidades/rotas.dart';
import 'package:arquitetur_mvvm/paginas/chat/chat-view.dart';
import 'package:arquitetur_mvvm/paginas/formulario-aluno/formulario-aluno-view.dart';
import 'package:arquitetur_mvvm/paginas/listagem-aluno/listagem-aluno-view.dart';
import 'package:arquitetur_mvvm/paginas/remover-aluno/remover-aluno-view.dart';
import 'package:flutter/material.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) async {
    print("Erro inesperado na aplicação:" + details.exceptionAsString());
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Arquitetura MVVM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TabPage(),
        routes: <String, WidgetBuilder>{
          //5
          Rotas.listagemAluno: (BuildContext context) =>
              new ListagemAlunoPage(), //6
          Rotas.formularioAluno: (BuildContext context) =>
              new FormularioAlunoPage(),
          Rotas.chat : (BuildContext context) =>
              new ChatPage(), //7
        });
  }
}

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => new _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
  var _current_tab = 0;
  PageController _pageController;
  void initState() {
    _pageController = new PageController(
      initialPage: _current_tab,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: <Widget>[ListagemAlunoPage(), RemoverAlunoPage(), ChatPage()],
          controller: _pageController,
          onPageChanged: (newPage) {
            setState(() {
              this._current_tab = newPage;
            });
          },
        ),
        bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _current_tab,
          onTap: (index) {
            this._pageController.jumpToPage(index);
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                title: Text('Listagem')),                
            new BottomNavigationBarItem(
                icon: const Icon(Icons.edit),
                title: Text('Excluir')),                
            new BottomNavigationBarItem(
                icon: const Icon(Icons.message),
                title: Text('Chat'))
          ],
        ));
  }
}
