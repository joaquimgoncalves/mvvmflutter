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

}
