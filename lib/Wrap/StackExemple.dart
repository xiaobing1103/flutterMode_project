import 'package:flutter/material.dart';

//   web中的绝对定位

class StackExemple extends StatefulWidget {
  const StackExemple({super.key});

  @override
  State<StackExemple> createState() => _StackExempleState();
}

class _StackExempleState extends State<StackExemple> {
  String _showCurrentWidget = 'stack1';

  late final Map<String, Widget> _stacks = {
    'stack1': Stack(
      alignment: Alignment.center,
      fit: StackFit.expand, //未定位widget占满Stack整个空间

      // 可以看到，由于第二个子文本组件没有定位，所以fit属性会对它起作用
      // ，就会占满Stack。由于Stack子元素是堆叠的，所以第一个子文本组件
      // 被第二个遮住了，而第三个在最上层，所以可以正常显示。
      children: <Widget>[
        // 被元素覆盖时，后添加的元素会覆盖在前面的元素上
        Positioned(
          left: 18.0,
          child: Text("绝对定位元素1"),
        ),
        Container(
          color: const Color.fromARGB(255, 169, 166, 163),
          child: Text("Container 元素", style: TextStyle(color: Colors.white)),
        ),
        Positioned(
          top: 18.0,
          child: Text("绝对定位元素2"),
        )
      ],
    ),
    'stack2': ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Container(
            color: const Color.fromARGB(255, 255, 228, 226),
            child: Text("Container 元素", style: TextStyle(color: Colors.white)),
          ),
          Positioned(
            left: 18.0,
            child: Text("绝对定位元素1"),
          ),
          Positioned(
            top: 18.0,
            child: Text("绝对定位元素2"),
          )
        ],
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
                onTap: () => setState(() => _showCurrentWidget = 'stack1'),
                child: const Text('Stack和绝对定位1'),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _showCurrentWidget = 'stack2'),
                child: const Text('Stack和绝对定位2'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: _stacks[_showCurrentWidget],
        ),
      ],
    );
  }
}
