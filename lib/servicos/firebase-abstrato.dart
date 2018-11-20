import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class FirebaseAbstrato<T> {
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

  String getPathName();
  T fromMap(Map<dynamic, dynamic> mapa);
  Map<dynamic, dynamic> toMap(T obj);

  Future<List<T>> liste() async {
    var db = await getDb();
    var snapshot = await db.reference().child(getPathName()).once();
    var objetos = List<T>();
    Map<dynamic, dynamic> values = snapshot.value;

    if (values != null) {
      values.values.forEach((v) {
        Map<dynamic, dynamic> mapa = v;
        var obj = fromMap(mapa);
        objetos.add(obj);
      });
    }

    return objetos;
  }

  insira(T obj) async {
    var db = await getDb();
    await db.reference().child(getPathName()).push().set(toMap(obj));
  }
}