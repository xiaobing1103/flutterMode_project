import 'package:flutter/material.dart';

class Tapboxa extends StatefulWidget {
  const Tapboxa({Key? key}) : super(key: key);

  @override
  State<Tapboxa> createState() => _TapboxaState();
}

class _TapboxaState extends State<Tapboxa> {
  bool _active = false;
  bool _useDarkVariant = false;

  @override
  Widget build(BuildContext context) {
    final backgroundAsset =
        _useDarkVariant ? 'graphics/dark/back.png' : 'graphics/back.png';
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapboxA 示例'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('使用 dark 变体'),
            subtitle: Text('当前加载: $backgroundAsset'),
            value: _useDarkVariant,
            onChanged: (value) {
              setState(() {
                _useDarkVariant = value;
              });
            },
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _active = !_active;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(backgroundAsset),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    color: _active ? Colors.blue : Colors.grey,
                    child: Center(
                      child: Text(
                        _active ? 'Active' : 'Inactive',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
