import 'package:arquitetur_mvvm/entidades/aluno.dart';

class FormularioAlunoViewModel{
    String nome;
    int id;

    Aluno obtenhaAluno(){
      return Aluno(id,nome);      
    }
}