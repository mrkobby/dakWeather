import 'package:flutter/material.dart';


class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final Icon iconType;

  const CustomIconButton({@required this.onPressed, @required this.iconType});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30.0,
      icon: iconType,
      onPressed: onPressed,
    );
  }
}