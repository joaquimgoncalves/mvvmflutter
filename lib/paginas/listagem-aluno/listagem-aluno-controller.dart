import 'package:arquitetur_mvvm/dal/aluno-dao.dart';
import 'package:arquitetur_mvvm/entidades/rotas.dart';
import 'package:arquitetur_mvvm/observadores/observador-aluno.dart';
import 'package:arquitetur_mvvm/paginas/arquitetura/controller-abstrato.dart';
import 'package:arquitetur_mvvm/paginas/listagem-aluno/listagem-aluno-viewmodel.dart';
import 'package:arquitetur_mvvm/servicos/aluno-firebase.dart';
import 'package:flutter/widgets.dart';

class ListagemAlunoController extends ControllerAbstrato {

  ListagemAlunoViewModel viewModel = ListagemAlunoViewModel();    
  TextEditingController pesquisaController = TextEditingController();

  ListagemAlunoController(viewState) : super(viewState) {    
   
   pesquisaController.addListener(() {
      viewModel.textoPesquisa = pesquisaController.text;
      filtre();
    });

    ObservadorAluno.observe((indice) => listeTodos());
  }

  listeTodos() async {
    viewModel.alunosLista = await AlunoFirebase.instancia.liste();    
    setStateAll();
  }

  filtre(){
    if(viewModel.textoPesquisa.isNotEmpty){
      AlunoDAO.instancia.liste().then((itens) {
        viewModel.alunosLista = itens.where((aluno) => aluno.nome.toLowerCase().contains(viewModel.textoPesquisa.toLowerCase())).toList();
        setStateAll();
      });
    }
  }

  abrirFormulario() {
    pushPageWithCallback(Rotas.formularioAluno, (valor) => listeTodos());    
  }

  pesquisar() {
    setState(() => viewModel.pesquisando = true);
  }

  void cancelarPesquisa() {
    viewModel.textoPesquisa = "";
    viewModel.pesquisando = false;
    listeTodos();
    setStateAll();
  }
}