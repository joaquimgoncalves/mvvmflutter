import 'package:arquitetur_mvvm/dal/aplicacao-dao.dart';
import 'package:arquitetur_mvvm/entidades/aluno.dart';
import 'package:arquitetur_mvvm/observadores/observador-aluno.dart';

class AlunoDAO{

  static AlunoDAO instancia = AlunoDAO();

  AlunoDAO(){    
    ObservadorAluno.observe((indice) => remova(indice));
  }

  insira(Aluno aluno){

    AplicacaoDAO.obtenhaBancoDados().then((db) {
        var map = aluno.getMap();
        db.insert('Aluno', map);
    });
  }

  remova(int indice) async {
    var itens = await liste();
    if(itens.length >= (indice +  1)){
      var db = await AplicacaoDAO.obtenhaBancoDados();
      await db.delete('Aluno', where: 'id = ?', whereArgs: [itens[indice].id]);
    }
  }

  Future<List<Aluno>> liste() async {
    
    var db = await AplicacaoDAO.obtenhaBancoDados();
    var map = await db.query('Aluno');
    var resultado = List<Aluno>();

    for (var i = 0; i < map.length; i++) {
      resultado.add(Aluno.fromMap(map[i]));
    }

    return resultado;
  }
}