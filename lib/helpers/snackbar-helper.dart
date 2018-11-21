import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackbarHelper {
  static SnackBar crieSnackbarLoading(BuildContext context) {
    return SnackBar(
        content: new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new CircularProgressIndicator(),
        new Padding( padding: EdgeInsets.symmetric(horizontal: 8),),
        new Text("Carregando"),
      ],
    ));
  }
}
