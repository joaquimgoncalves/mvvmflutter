import 'package:arquitetur_mvvm/validadores/validador-textform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioHelper {
  static Widget crieTextField(String label, TextEditingController controller, [bool apenasNumerico = false]) {
    return new Expanded(
        child: TextFormField(
          controller: controller,
          autovalidate: true,
          keyboardType: apenasNumerico ? TextInputType.numberWithOptions(decimal: true ) : TextInputType.text,
          decoration: InputDecoration(labelText: label),
          validator: apenasNumerico ? ValidadorTextForm.ValideMaiorQueZero : ValidadorTextForm.ValideNaoNulo),
    );
  }

  static Widget crieTextArea(String label) {
    return new Expanded(
        child: TextFormField(
          autovalidate: true,
          maxLines: 3,
          keyboardType:TextInputType.multiline,
          decoration: InputDecoration(labelText: label),
          validator: ValidadorTextForm.ValideNaoNulo),
    );
  }
}
