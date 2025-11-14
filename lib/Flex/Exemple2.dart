import 'package:flutter/material.dart';

class Exemple2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(20.0)),
        
        SizedBox(
          width: 250.0,
          height: 50.0,
          //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  color: const Color.fromARGB(255, 56, 50, 50),
                ),
              ),
              const Spacer(flex: 1),
              const Spacer(flex: 1),
              const Spacer(flex: 1),
              const Spacer(flex: 1),
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromARGB(255, 98, 46, 172),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromARGB(255, 39, 49, 160),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromARGB(255, 223, 90, 243),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromARGB(255, 98, 46, 172),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
