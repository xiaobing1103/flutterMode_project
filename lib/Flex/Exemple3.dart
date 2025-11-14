import 'dart:math';

import 'package:flutter/material.dart';

class Exemple3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(height: 50, color: Colors.red),
        Expanded(
            child: Text(
          'Spacer',
          style: TextStyle(fontSize: 24),
        )),
        Container(height: 50, color: Colors.blue),
      ],
    );
  }
}

class Spacer extends StatelessWidget {
  const Spacer({Key? key, this.flex = 1})
      : assert(flex > 0),
        super(key: key);

  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: const SizedBox.shrink(),
    );
  }
}
