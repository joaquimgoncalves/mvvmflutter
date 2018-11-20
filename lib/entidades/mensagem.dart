class Mensagem{
  String mensagem;
  String nomeOrigem;

  Mensagem(this.mensagem,this.nomeOrigem);

  static Mensagem fromMap(Map<dynamic,dynamic> mapa){
    return Mensagem(      
      mapa['mensagem'],
      mapa['nomeOrigem']
    );
  }

  Map<String, dynamic> toMap(){
    var map = Map<String,dynamic>();    
    map['mensagem'] = mensagem;
    map['nomeOrigem'] = nomeOrigem;
    return map;
  }
}