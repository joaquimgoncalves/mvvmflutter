import 'package:arquitetur_mvvm/entidades/mensagem.dart';
import 'package:arquitetur_mvvm/paginas/chat/chat-viewmodel.dart';
import 'package:arquitetur_mvvm/servicos/mensagem-firebase.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/widgets.dart';

class ChatController {
  var viewModel = ChatViewModel();
  State viewState;
  BuildContext context;
  var textoMensagemController = TextEditingController();
  var listController = ScrollController();

  ChatController(this.viewState) {
    textoMensagemController.addListener(() {
      viewModel.textoMensagem = textoMensagemController.text;

      viewState.setState(() {
        if(viewState.mounted)
          viewModel.escrevendoMensagem = viewModel.textoMensagem.length > 0;
      });
    });

    monitoreMensagens();
  }

  envieMensagem() {
    if (viewModel.textoMensagem.length == 0) return;
    if (viewModel.modeloDispositivo.length == 0) {
      DeviceInfoPlugin().androidInfo.then((androidInfo) {
        viewModel.modeloDispositivo = androidInfo.model;
        salveMensagem();
      });
    } else {
      salveMensagem();
    }
  }

  salveMensagem() {
    var mensagem =
        Mensagem(viewModel.textoMensagem, viewModel.modeloDispositivo, DateTime.now());
    MensagemFirebase.instancia.insira(mensagem);

    viewState.setState(() {
      if(viewState.mounted)
        textoMensagemController.clear();
    });
  }

  void listeMensagens() {
    // MensagemFirebase.instancia.liste().then((lista) {
    //   viewState.setState(() {
    //     if(viewState.mounted){
    //       viewModel.listaMensagens = lista;     
    //       print("mensagem listada");
    //     }
          
    //   });
    // });
  }

  void monitoreMensagens() {
    MensagemFirebase.instancia.novaMensagem((mensagem) {
      viewState.setState(() {
        if(viewState.mounted){
          viewModel.listaMensagens.add((mensagem));
          listController.jumpTo(listController.position.maxScrollExtent + 100);
          print("Mensagem recebida! " + mensagem.mensagem);
        }        
      });
    });
  }
}
