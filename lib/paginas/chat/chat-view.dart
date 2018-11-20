import 'package:arquitetur_mvvm/entidades/mensagem.dart';
import 'package:arquitetur_mvvm/paginas/chat/chat-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatState createState() {
    var state = _ChatState();
    state.controller = ChatController(state);
    return state;
  }
}

class _ChatState extends State<ChatPage> {
  ChatController controller;

  @override
  initState() {
    super.initState();
    controller.listeMensagens();
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    return Scaffold(body: _buildContainer(), resizeToAvoidBottomPadding: false);
  }

  Widget _buildContainer() {
    return Container(
        child: Column(
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          child: _buildList(),
        ),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ],
    ));
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(
          color: controller.viewModel.escrevendoMensagem
              ? Theme.of(context).accentColor
              : Theme.of(context).disabledColor,
        ),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              // new Container(
              //   margin: new EdgeInsets.symmetric(horizontal: 4.0),
              //   child: new IconButton(
              //       icon: new Icon(
              //         Icons.photo_camera,
              //         color: Theme.of(context).accentColor,
              //       ),
              //       onPressed: () async {
              //         // await _ensureLoggedIn();
              //         // File imageFile = await ImagePicker.pickImage();
              //         // int timestamp = new DateTime.now().millisecondsSinceEpoch;
              //         // StorageReference storageReference = FirebaseStorage
              //         //     .instance
              //         //     .ref()
              //         //     .child("img_" + timestamp.toString() + ".jpg");

              //         // storageReference.putFile(imageFile);

              //         // Uri downloadUrl = await storageReference.getDownloadURL();
              //         // _sendMessage(
              //         //     messageText: null, imageUrl: downloadUrl.toString());
              //       }),
              // ),
              new Flexible(
                child: new TextField(
                  controller: controller.textoMensagemController,
                  decoration: new InputDecoration.collapsed(
                      hintText: "Escreva uma mensagem"),
                ),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: getDefaultSendButton(),
              ),
            ],
          ),
        ));
  }

  IconButton getDefaultSendButton() {
    return new IconButton(
        icon: new Icon(Icons.send), onPressed: () {
          controller.envieMensagem();
        });
  }

  Widget _buildList() {
    return ListView(      
      controller: controller.listController,
      padding: const EdgeInsets.only(top: 20.0),
      children: controller.viewModel.listaMensagens
          .map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Mensagem mensagem) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: Container(
          child: ListTile(
            title: Text(
              mensagem.nomeOrigem,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(mensagem.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      Divider(
        color: Colors.grey[300],
      )
    ]);
  }
}
