class Aluno {
  int id;
  String nome;

  Aluno(this.id, this.nome);

  Map<String, dynamic> getMap() {
    var map = Map<String,dynamic>();
    map['id'] = id;
    map['nome'] = nome;
    return map;
  }

  static Aluno fromMap(Map<String, dynamic> map) {
    return Aluno(map['id'], map['nome']);
  }
}