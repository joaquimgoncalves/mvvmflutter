import 'package:arquitetur_mvvm/entidades/mensagem.dart';

class ChatViewModel {
  bool escrevendoMensagem = false;
  var listaMensagens = List<Mensagem>();
  String textoMensagem = "";
  String modeloDispositivo = "";
}