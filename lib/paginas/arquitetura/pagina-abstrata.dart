import 'package:arquitetur_mvvm/paginas/arquitetura/controller-abstrato.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class PaginaAbstrata extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    var state = getState();
    state.controller = getController(state);
    return state;
  }

  PageStateAbstract getState();
  ControllerAbstrato getController(PageStateAbstract state);
}

abstract class PageStateAbstract<T extends PaginaAbstrata,
    C extends ControllerAbstrato> extends State<T> {
  C controller;

  Widget getWidgets();

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return getWidgets();
  }

  void apresenteDialogo(BuildContext context, String descricao,
      {String titulo = "Atenção", void Function() callback}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(titulo),
            content: new Text(descricao),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (callback != null) callback();
                },
              ),
            ],
          );
        });
  }

  void confirme(
      BuildContext context, String descricao, void Function() callback,
      {String titulo = "Pergunta"}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(titulo),
            content: new Text(descricao),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.red[300]),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text("Sim"),
                onPressed: () {
                  Navigator.of(context).pop();
                  callback();
                },
              ),
            ],
          );
        });
  }
}
