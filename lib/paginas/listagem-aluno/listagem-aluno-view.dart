import 'package:arquitetur_mvvm/entidades/aluno.dart';
import 'package:arquitetur_mvvm/paginas/listagem-aluno/listagem-aluno-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListagemAlunoPage extends StatefulWidget {
  @override
  _ListagemAlunoState createState() {
    var state = _ListagemAlunoState();
    state.controller = ListagemAlunoController(state);
    return state;
  }
}

class _ListagemAlunoState extends State<ListagemAlunoPage> {
  ListagemAlunoController controller;

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    return Scaffold(
      appBar: controller.viewModel.pesquisando
          ? _buildBarPesquisar(context)
          : _buildBarPadrao(context),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.abrirFormulario(),
        tooltip: 'Novo',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBarPadrao(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: Text("Lista"),
      leading: new IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () { controller.pesquisar(); },
      ),
    );
  }

  Widget _buildBarPesquisar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: new TextField(
        autofocus: true,        
        controller: controller.pesquisaController,
        decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search, color: Colors.white,), hintText: 'Pesquisar...'),
      ),
      leading: new IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () { controller.cancelarPesquisa(); },
      ),
    );
  }

  Widget _buildList() {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: controller.viewModel.alunosLista
          .map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Aluno aluno) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: Container(
          child: ListTile(
            title: Text(
              aluno.nome,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      Divider(
        color: Colors.grey,
      )
    ]);
  }
}
