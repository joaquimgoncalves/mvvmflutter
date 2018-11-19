import 'dart:io';

import 'package:path_provider/path_provider.dart';

class UtilitarioArquivo {
  
  static Future<String> obtenhaDiretorioLocal() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<String> obtenhaDiretorioArmazenamentoExterno() async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  static Future<String> obtenhaDiretorioTemporario() async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  static Future<File> obtenhaArquivoLocal(String nome) async {
    final path = await obtenhaDiretorioLocal();
    return File('$path/$nome');
  }

  static Future<String> obtenhaDiretorioArquivoLocal(String nome) async {
    final path = await obtenhaDiretorioLocal();
    return '$path/$nome';
  }

  static Future<File> obtenhaArquivoExterno(String nome) async {
    final path = await obtenhaDiretorioArmazenamentoExterno();
    return File('$path/$nome');
  }

  static Future<File> obtenhaArquivoTemporario(String nome) async {
    final path = await obtenhaDiretorioArmazenamentoExterno();
    return File('$path/$nome');
  }
 
}