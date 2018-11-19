import 'package:arquitetur_mvvm/observadores/observador-aluno.dart';
import 'package:arquitetur_mvvm/paginas/remover-aluno/remover-aluno-viewmodel.dart';
import 'package:flutter/widgets.dart';

class RemoverAlunoController{
  var viewModel = RemoverAlunoViewModel();  
  BuildContext context;  
  State viewState;

  TextEditingController indiceController = TextEditingController();  

  RemoverAlunoController(this.viewState){
    indiceController.addListener(() => viewModel.indice = int.tryParse(indiceController.text));    
  }

  remova(){
    ObservadorAluno.notifique(viewModel.indice);
  }
}