import 'package:flutter/material.dart';

class IconoMenu extends StatelessWidget {
  var widgetMenu;
  IconoMenu({this.widgetMenu});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          child: Material(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: widgetMenu.onMenuPressed,
            ),
          ),
        ),
      ],
    );
  }
}
