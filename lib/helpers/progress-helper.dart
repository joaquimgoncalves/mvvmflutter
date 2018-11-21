import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressHelper {
  static Widget obtenhaProgress() {

    var container = Container(
      color: Colors.transparent,
      width: 70.0,
      height: 70.0,
      child: new Padding(
          padding: const EdgeInsets.all(5.0),
          child: new Center(child: new CircularProgressIndicator())),
    );

    return Align(child: container,alignment: FractionalOffset.center);
  }
}
