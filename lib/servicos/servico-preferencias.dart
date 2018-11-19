import 'package:shared_preferences/shared_preferences.dart';

class ServicoConfiguracao {
  
  Future<int> obtenhaInteiro(String chave) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(chave);
  }

  Future<String> obtenhaString(String chave) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(chave);
  }

  void definaInteiro(String chave, int valor) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(chave, valor);
  }

  void definaString(String chave, String valor) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(chave, valor);
  }
  
}