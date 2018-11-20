import 'package:arquitetur_mvvm/entidades/aluno.dart';
import 'package:arquitetur_mvvm/servicos/firebase-abstrato.dart';

class AlunoFirebase extends FirebaseAbstrato<Aluno> {
  static var instancia = AlunoFirebase();

  Future<bool> elimine(int id) async {
    var key = await obtenhaKey(id);

    if (key != null) {
      var db = await getDb();

      db.reference().child('alunos').child(key).remove();

      return true;
    }

    return false;
  }

  Future<String> obtenhaKey(int id) async {
    var db = await getDb();
    var snapshot = await db
        .reference()
        .child('alunos')
        .orderByChild('id')
        .equalTo(id)
        .once();
    Map mapa = snapshot.value;

    if (mapa != null) {
      return mapa.keys.toList()[0].toString();
    }

    return null;
  }

  @override
  String getPathName() {    
    return 'alunos';
  }

  @override
  Aluno fromMap(Map mapa) {
    return Aluno.fromMap(mapa);
  }

  @override
  Map toMap(Aluno obj) {
    return obj.getMap();
  }
}
