import 'package:arquitetur_mvvm/entidades/aluno.dart';

class AlunoDAO{

  List<Aluno> _repositorio = List<Aluno>();

  static AlunoDAO instancia = AlunoDAO();

  AlunoDAO(){
    _repositorio.addAll(
      [
        Aluno(1, "João Miguel da Silva Sauro"),
        Aluno(2, "Maria Amélia Pereira Rodrigues"),
      ]
    );
  }

  insira(Aluno aluno){
    _repositorio.add(aluno);
  }

  List<Aluno> liste(){
    return _repositorio;
  }
}