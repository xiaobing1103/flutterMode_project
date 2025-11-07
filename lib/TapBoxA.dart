import 'package:flutter/material.dart';

class Tapboxa extends StatefulWidget {
  const Tapboxa({Key? key}) : super(key: key);

  @override
  State<Tapboxa> createState() => _TapboxaState();
}

class _TapboxaState extends State<Tapboxa> {
  bool _active = false;
  bool _useDarkVariant = false;
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    // final backgroundAsset =
    //     _useDarkVariant ? 'graphics/dark/back.png' : 'graphics/back.png';
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapboxA 示例'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: _checkboxSelected,
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value ?? false;
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _checkboxSelected = !_checkboxSelected;
                  });
                },
                child: const Text('复选框示例',
                    style: TextStyle(fontSize: 18, fontFamily: 'ZhiMangXing')),
              ),
            ],
          ),
          Transform.scale(
            scale: 0.8, // 放大倍数
            child: Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
          ),
          SwitchListTile(
            title: const Text('使用 dark 变体'),
            subtitle: Text('当前加载: '),
            value: _useDarkVariant,
            onChanged: (value) {
              setState(() {
                _useDarkVariant = value;
              });
            },
          ),
          const SizedBox(height: 14),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _active = !_active;
                });
              },
              child: SizedBox(
                width: 70,
                height: 50,
                child: Container(
                  color: _active ? Colors.blue : Colors.grey,
                  alignment: Alignment.center,
                  child: Text(
                    _active ? '激活' : '未激活',
                    style: const TextStyle(color: Colors.white),
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
