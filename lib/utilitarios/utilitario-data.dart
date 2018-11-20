import 'package:intl/intl.dart';

class UtilitarioData {
  
  static String dataDiaMesAno(DateTime data) {
    return DateFormat('dd/MM/yyyy').format(data);
  }

  static String dataHoraMinuto(DateTime data) {
    return DateFormat('HH:mm').format(data);
  }
}