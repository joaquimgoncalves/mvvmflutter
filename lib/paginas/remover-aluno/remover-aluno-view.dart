import 'package:arquitetur_mvvm/helpers/formulario-helper.dart';
import 'package:arquitetur_mvvm/paginas/arquitetura/controller-abstrato.dart';
import 'package:arquitetur_mvvm/paginas/arquitetura/pagina-abstrata.dart';
import 'package:arquitetur_mvvm/paginas/remover-aluno/remover-aluno-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RemoverAlunoPage extends PaginaAbstrata {
  
  @override
  ControllerAbstrato getController(PageStateAbstract<PaginaAbstrata, ControllerAbstrato> state) {
    return RemoverAlunoController(state);
  }

  @override
  PageStateAbstract<PaginaAbstrata, ControllerAbstrato> getState() {
    return _RemoverAlunoState();
  }
}

class _RemoverAlunoState extends PageStateAbstract<RemoverAlunoPage, RemoverAlunoController> {
 
  @override
  Widget getWidgets() {
    return Scaffold(      
      body: ListView(padding: EdgeInsets.all(30), children: <Widget>[
        Row(
          children: <Widget>[
            FormularioHelper.crieTextField(
                "Id do aluno", controller.idController),
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
