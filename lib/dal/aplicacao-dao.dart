import 'package:sqflite/sqflite.dart';
import 'package:arquitetur_mvvm/utilitarios/utilitario-arquivo.dart';

class AplicacaoDAO {

    static Future<Database> obtenhaBancoDados() async {
      Database database = await openDatabase(await UtilitarioArquivo.obtenhaDiretorioArquivoLocal('mvvm.db3'), version: 1,
         onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Aluno (id INTEGER PRIMARY KEY, nome TEXT)");
      });

      return database;
    }
}