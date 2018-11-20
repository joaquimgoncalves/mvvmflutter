typedef void CallbackObservador(int indice);

class ObservadorAluno {
  static var callbacks = List<CallbackObservador>();

  static void observe(CallbackObservador callback) {
    callbacks.add(callback);
  }

  static void notifique(int indice) {
    if (indice != null) {
      for (var i = 0; i < callbacks.length; i++) {
        callbacks[i](indice);
      }
    }
  }
}
