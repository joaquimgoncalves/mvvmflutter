import 'package:flutter/widgets.dart';

class ControllerAbstrato {
   State viewState;
   BuildContext context;  

   ControllerAbstrato(this.viewState, this.context);
}