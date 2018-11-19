import 'package:arquitetur_mvvm/dal/aluno-dao.dart';
import 'package:arquitetur_mvvm/paginas/formulario-aluno/formulario-aluno-viewmodel.dart';
import 'package:flutter/widgets.dart';

class FormularioAlunoController {
  
  FormularioAlunoViewModel viewModel = FormularioAlunoViewModel();  
  BuildContext context;  
  State viewState;

  TextEditingController nomeController = TextEditingController();
  TextEditingController idController = TextEditingController();

  FormularioAlunoController(this.viewState){
    nomeController.addListener(() => viewModel.nome = nomeController.text);
    idController.addListener(() => viewModel.id = int.tryParse(idController.text));    
  }

  salve(){
    AlunoDAO.instancia.insira(viewModel.obtenhaAluno());
    Navigator.of(context).pop();
  }
}