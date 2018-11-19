import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static apresenteMensagem(String mensagem){
    Fluttertoast.showToast(
        msg: mensagem,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
    );
  }
}