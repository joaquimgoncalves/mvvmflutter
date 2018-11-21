import 'package:arquitetur_mvvm/dal/aluno-dao.dart';
import 'package:arquitetur_mvvm/paginas/arquitetura/controller-abstrato.dart';
import 'package:arquitetur_mvvm/paginas/formulario-aluno/formulario-aluno-viewmodel.dart';
import 'package:arquitetur_mvvm/servicos/aluno-firebase.dart';
import 'package:flutter/widgets.dart';

class FormularioAlunoController extends ControllerAbstrato {
  
  FormularioAlunoViewModel viewModel = FormularioAlunoViewModel();  

  TextEditingController nomeController = TextEditingController();
  TextEditingController idController = TextEditingController();

  FormularioAlunoController(viewState) : super(viewState) {
    nomeController.addListener(() => viewModel.nome = nomeController.text);
    idController.addListener(() => viewModel.id = int.tryParse(idController.text));    
  }

  salve(){
    //AlunoDAO.instancia.insira(viewModel.obtenhaAluno());
    AlunoFirebase.instancia.insira(viewModel.obtenhaAluno());
    Navigator.of(context).pop();
  }
}