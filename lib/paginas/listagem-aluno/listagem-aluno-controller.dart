import 'package:arquitetur_mvvm/dal/aluno-dao.dart';
import 'package:arquitetur_mvvm/entidades/rotas.dart';
import 'package:arquitetur_mvvm/observadores/observador-aluno.dart';
import 'package:arquitetur_mvvm/paginas/listagem-aluno/listagem-aluno-viewmodel.dart';
import 'package:flutter/widgets.dart';

class ListagemAlunoController {

  ListagemAlunoViewModel viewModel = ListagemAlunoViewModel();  
  State viewState;
  BuildContext context;  

  TextEditingController pesquisaController = TextEditingController();

  ListagemAlunoController(this.viewState){    
    pesquisaController.addListener(() {
      viewModel.textoPesquisa = pesquisaController.text;
      filtre();
    });

    ObservadorAluno.observe((indice) => listeTodos());
  }

  listeTodos() async {
    viewModel.alunosLista = await AlunoDAO.instancia.liste();
    if(viewState.mounted)
      viewState.setState((){
        
      });
  }

  filtre(){
    if(viewModel.textoPesquisa.isNotEmpty){
      AlunoDAO.instancia.liste().then((itens) {
        viewModel.alunosLista = itens.where((aluno) => aluno.nome.toLowerCase().contains(viewModel.textoPesquisa.toLowerCase())).toList();
        viewState.setState((){});
      });
    }
  }

  abrirFormulario() {
    Navigator.of(context).pushNamed(Rotas.formularioAluno)
    .then((onValue) => listeTodos());
  }

  pesquisar() {
    viewModel.pesquisando = true;
    viewState.setState((){});
  }

  void cancelarPesquisa() {
    viewModel.textoPesquisa = "";
    viewModel.pesquisando = false;
    listeTodos();
    viewState.setState((){});
  }
}