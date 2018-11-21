import 'package:arquitetur_mvvm/helpers/toast-helper.dart';
import 'package:arquitetur_mvvm/observadores/observador-aluno.dart';
import 'package:arquitetur_mvvm/paginas/arquitetura/controller-abstrato.dart';
import 'package:arquitetur_mvvm/paginas/remover-aluno/remover-aluno-viewmodel.dart';
import 'package:arquitetur_mvvm/servicos/aluno-firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RemoverAlunoController extends ControllerAbstrato {
  var viewModel = RemoverAlunoViewModel();  

  TextEditingController idController = TextEditingController();

  RemoverAlunoController(viewState) : super(viewState) {
    idController
        .addListener(() => viewModel.id = int.tryParse(idController.text));
  }

  remova() {
    AlunoFirebase.instancia.elimine(viewModel.id).then((removeu) {
      if (removeu) {
        ObservadorAluno.notifique(viewModel.id);
        ToastHelper.apresenteMensagem("Aluno excluído.");
      }
      else{
        ToastHelper.apresenteMensagem("Nenhum aluno com este ID.");
      }
    });
  }
}
