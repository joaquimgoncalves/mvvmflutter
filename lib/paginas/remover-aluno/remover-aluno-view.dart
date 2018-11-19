import 'package:arquitetur_mvvm/helpers/formulario-helper.dart';
import 'package:arquitetur_mvvm/paginas/remover-aluno/remover-aluno-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RemoverAlunoPage extends StatefulWidget {
  @override
  _RemoverAlunoState createState() {
    var viewState = _RemoverAlunoState();
    viewState.controller = RemoverAlunoController(viewState);
    return viewState;
  }
}

class _RemoverAlunoState extends State<RemoverAlunoPage> {
  RemoverAlunoController controller;

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Scaffold(      
      body: ListView(padding: EdgeInsets.all(30), children: <Widget>[
        Row(
          children: <Widget>[
            FormularioHelper.crieTextField(
                "Índice para remover", controller.indiceController),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            MaterialButton(
              onPressed: () => controller.remova(),
              child: Text("Remover"),
            )
          ],
        )
      ]),
    );
  }
}
