import 'package:flutter/material.dart';
import 'package:my_app/Flex/Exemple1.dart';
import 'package:my_app/Flex/Exemple2.dart';
import 'package:my_app/Flex/Exemple3.dart';

class Output extends StatefulWidget {
  const Output({super.key});

  @override
  State<Output> createState() => _OutputState();
}

class _OutputState extends State<Output> {
  final Map<String, Widget> _examples = {
    '示例一': OutExemple1(),
    '示例二': Exemple2(),
    '示例三': Exemple3(),
  };
  late String _currentKey = _examples.keys.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex 布局示例'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownButton<String>(
              value: _currentKey,
              isExpanded: true,
              items: _examples.keys
                  .map((key) => DropdownMenuItem(value: key, child: Text(key)))
                  .toList(),
              onChanged: (value) {
                if (value == null || value == _currentKey) return;
                setState(() => _currentKey = value);
              },
            ),
          ),
          Expanded(child: _examples[_currentKey]!),
        ],
      ),
    );
  }
}
