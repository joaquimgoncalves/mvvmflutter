import 'package:arquitetur_mvvm/helpers/formulario-helper.dart';
import 'package:arquitetur_mvvm/paginas/formulario-aluno/formulario-aluno-controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioAlunoPage extends StatefulWidget {
  @override
  _FormularioAlunoState createState() {
    var viewState = _FormularioAlunoState();
    viewState.controller = FormularioAlunoController(viewState);
    return viewState;
  }
}

class _FormularioAlunoState extends State<FormularioAlunoPage> {
  FormularioAlunoController controller;

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget>[
          Row(
            children: <Widget>[
              FormularioHelper.crieTextField("Código", controller.idController),
            ],
          ),
          Row(
            children: <Widget>[
              FormularioHelper.crieTextField("Nome", controller.nomeController),
            ],
          ),
          Column(            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[            
            Padding(
              padding: EdgeInsets.only(top:20),
            ),
            MaterialButton(
              child: Text("Incluir aluno"),
              onPressed: () => controller.salve(),
            )
          ],)
        ]),
    );
  } 
}
