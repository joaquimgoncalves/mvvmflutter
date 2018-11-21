import 'package:flutter/widgets.dart';

class ControllerAbstrato {
  State viewState;
  BuildContext context;

  ControllerAbstrato(this.viewState);

  setState(void Function() acao) {
    if (viewState.mounted) viewState.setState(acao);
  }

  setStateAll() {
    if (viewState.mounted) viewState.setState(() {});
  }

  pushPage(String rota) {
    Navigator.of(context).pushNamed(rota);
  }

  pushPageWithCallback(String rota, void Function(dynamic value) callback) {
    Navigator.of(context).pushNamed(rota).then(callback);
  }
}
