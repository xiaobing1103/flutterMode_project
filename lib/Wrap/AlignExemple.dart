import 'package:flutter/material.dart';

class AlignExemple extends StatefulWidget {
  @override
  _AlignExempleState createState() => _AlignExempleState();
}

class _AlignExempleState extends State<AlignExemple> {
  String _showCurrentWidget = 'Align1';

  late final Map<String, Widget> _stacks = {
    'Align1': Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue.shade50,
      child: Align(
        alignment: Alignment.topRight,
        child: FlutterLogo(
          size: 60,
        ),
      ),
    ),
    'Align2': Container(
      height: 120.0,
      width: 120.0,
      color: Colors.green.shade50,
      child: Align(
        widthFactor: 2,
        heightFactor: 2,
        alignment: Alignment(2.0, 0),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    ),
    'Align3': Container(
      height: 120.0,
      width: 120.0,
      color: Colors.green.shade50,
      child: Align(
        widthFactor: 2,
        heightFactor: 2,
        alignment: FractionalOffset(0.2, 0.6),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    )
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _showCurrentWidget = 'Align1'),
                child: const Text('Stack和绝对定位1'),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _showCurrentWidget = 'Align2'),
                child: const Text('Stack和绝对定位2'),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _showCurrentWidget = 'Align3'),
                child: const Text('Stack和绝对定位3'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
          child: _stacks[_showCurrentWidget],
        ),
      ],
    );
  }
}
