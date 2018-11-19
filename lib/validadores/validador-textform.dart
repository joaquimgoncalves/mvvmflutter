class ValidadorTextForm {
  
  static String ValideNaoNulo(String value) {
    if (value.isEmpty) {
      return 'Por favor informe um texto';
    }
  }

  static String ValideMaiorQueZero(String value){
    if(num.tryParse(value) == null || num.tryParse(value) <= 0)
      return "Informe um valor maior que 0";
  }
}
