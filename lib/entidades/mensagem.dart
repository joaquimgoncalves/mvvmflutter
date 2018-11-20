import 'package:arquitetur_mvvm/utilitarios/utilitario-data.dart';

class Mensagem {
  String mensagem;
  String nomeOrigem;
  DateTime dataEnvio;

  Mensagem(this.mensagem, this.nomeOrigem, this.dataEnvio);

  static Mensagem fromMap(Map<dynamic, dynamic> mapa) {
    return Mensagem(mapa['mensagem'], mapa['nomeOrigem'], DateTime.parse(mapa['dataEnvio']));
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['mensagem'] = mensagem;
    map['nomeOrigem'] = nomeOrigem;
    map['dataEnvio'] = dataEnvio.toString();
    return map;
  }

  @override
  String toString() {
    return UtilitarioData.dataHoraMinuto(dataEnvio) + ": " + mensagem;
  }
}
