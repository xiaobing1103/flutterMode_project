import 'package:flutter/material.dart';
import 'package:my_app/Wrap/StackExemple.dart';
import './ExempleWrap.dart';
import './ExempleWrap1.dart';
import 'AlignExemple.dart';

class OutPutWarp extends StatefulWidget {
  const OutPutWarp({super.key});

  @override
  State<OutPutWarp> createState() => _OutPutWarpState();
}

class _OutPutWarpState extends State<OutPutWarp> {
  final Map<String, Widget> _examples = {
    'ExempleWrap 示例': Exemplewrap(),
    'ExempleWrap1 示例': Exemplewrap1(),
    'AlignExemple 示例': AlignExemple(),
    'StackExemple 示例': StackExemple(),
  };
  late String _selectedKey = _examples.keys.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap 示例'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(6),
            child: Wrap(
              spacing: 10,
              runSpacing: 1,
              children: _examples.keys
                  .map(
                    (title) => ChoiceChip(
                      label: Text(title),
                      selected: title == _selectedKey,
                      onSelected: (selected) {
                        if (!selected || title == _selectedKey) return;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (!mounted) return;
                          setState(() => _selectedKey = title);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: _examples[_selectedKey]!,
            ),
          ),
        ],
      ),
    );
  }
}
