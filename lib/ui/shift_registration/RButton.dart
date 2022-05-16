import 'package:flutter/material.dart';

class RButton extends StatelessWidget {
  final int id;
  final Function onPressed;

  const RButton({required this.id, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 30,
        child: FlatButton(
          onPressed: () {
            onPressed(this.id);
            print(this.id);
          },
          textColor: Colors.red,
          child: Text("-"),
        ));
  }
}
