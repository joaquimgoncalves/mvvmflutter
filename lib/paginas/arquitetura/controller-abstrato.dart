import 'package:arquitetur_mvvm/helpers/snackbar-helper.dart';
import 'package:arquitetur_mvvm/paginas/arquitetura/pagina-abstrata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ControllerAbstrato {
  PageStateAbstract viewState;
  BuildContext context;
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbarController;

  ControllerAbstrato(this.viewState);

  setState(void Function() acao) {
    if (viewState.mounted) viewState.setState(acao);
  }

  setStateAll() {
    if (viewState.mounted) viewState.setState(() {});
  }

  pushPage(String rota) {
    Navigator.of(context).pushNamed(rota);
  }

  pushPageWithCallback(String rota, void Function(dynamic value) callback) {
    Navigator.of(context).pushNamed(rota).then(callback);
  }

  popPage(){
    Navigator.of(context).pop();
  }

  apresenteLoading() {    
    snackbarController = Scaffold.of(context).showSnackBar(SnackbarHelper.crieSnackbarLoading(context)); 
  } 

  removaLoading(){
    if(snackbarController != null){
      snackbarController.close();
      snackbarController = null;
    }
  }

  confirme(String pergunta, void Function() callback){
    viewState.confirme(context, pergunta, callback);
  }

  apresenteDialogo(String texto, {void Function() callback}){
    viewState.confirme(context, texto, callback);
  }
}
