import 'dart:io';

import 'package:arquitetur_mvvm/entidades/aluno.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class AlunoFirebase {
  static var instancia = AlunoFirebase();

  Future<FirebaseApp> getApp() async {
    return await FirebaseApp.configure(
      name: 'db2',
      options: Platform.isIOS
          ? const FirebaseOptions(
              googleAppID: '1:297855924061:ios:c6de2b69b03a5be8',
              gcmSenderID: '297855924061',
              databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
            )
          : const FirebaseOptions(
              googleAppID: '1:297855924061:android:669871c998cc21bd',
              apiKey: 'AIzaSyDv4ollWXnKbgF9RIsRVMQ2Vo9sfpd6fN0',
              databaseURL: 'https://arquitetura-mvvm.firebaseio.com/',
            ),
    );
  }

  Future<FirebaseDatabase> getDb() async {
    return FirebaseDatabase(app: await getApp());
  }

  liste() async {
    var db = await getDb();
    var snapshot = await db.reference().child('alunos').once();
    var alunos = List<Aluno>();
    Map<dynamic, dynamic> values = snapshot.value;

    if (values != null) {
      values.values.forEach((v) {
        Map<dynamic, dynamic> mapa = v;
        var aluno = Aluno.fromMap(mapa);
        alunos.add(aluno);
      });
    }

    return alunos;
  }

  insira(Aluno aluno) async {
    var db = await getDb();
    await db.reference().child('alunos').push().set(aluno.getMap());
  }

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
}
