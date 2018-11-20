import 'package:arquitetur_mvvm/entidades/mensagem.dart';
import 'package:arquitetur_mvvm/servicos/firebase-abstrato.dart';

class MensagemFirebase extends FirebaseAbstrato<Mensagem> {

  static MensagemFirebase instancia = MensagemFirebase();

  @override
  Mensagem fromMap(Map mapa) {
    return Mensagem.fromMap(mapa);
  }

  @override
  String getPathName() {
    return "mensagens";
  }

  @override
  Map toMap(Mensagem obj) {
    return obj.toMap();
  }

  void novaMensagem(void Function(Mensagem mensagem) callback) {
    getDb().then((db) {
      var stream = db.reference().child(getPathName()).onChildAdded;
      stream.listen((onData) {
        Map<dynamic,dynamic> mapa = onData.snapshot.value;
        var mensagem = Mensagem.fromMap(mapa);
        callback(mensagem);
      });
    });
  }

}