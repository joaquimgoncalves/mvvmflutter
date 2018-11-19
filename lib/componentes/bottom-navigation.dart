import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {

  final callback;

  BottomNavigation(this.callback);

  @override
  _BottomNavigationState createState() => new _BottomNavigationState();

}

class _BottomNavigationState extends State<BottomNavigation> {

  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;

  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: [
        new BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            title: Text('Listagem'),
            backgroundColor: Colors.blue
        ),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.edit),
            title: Text('Excluir'),
            backgroundColor: Colors.blue[800]
        )
      ],
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {

          _currentIndex = index;
          widget.callback(index);

        });
      },
    );

    return botNavBar;
  }
}