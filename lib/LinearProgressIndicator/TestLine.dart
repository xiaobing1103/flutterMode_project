import 'package:flutter/material.dart';

class TestLine extends StatefulWidget {
  const TestLine({super.key});

  @override
  State<TestLine> createState() => _TestLineState();
}

class _TestLineState extends State<TestLine> {
  double _progress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('线性进度条示例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgressRoute(),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: LinearProgressIndicator(
                backgroundColor: const Color.fromARGB(255, 174, 168, 168),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                value: _progress,
              ),
            ),
            const SizedBox(height: 20),
            Slider(
              value: _progress,
              min: 0,
              max: 1,
              divisions: 10,
              label: (_progress * 100).toStringAsFixed(0),
              onChanged: (value) => setState(() => _progress = value),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 201, 196, 196),
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: const SizedBox(
                height: 50,
                width: 150,
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromARGB(255, 175, 174, 174),
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: const Duration(seconds: 3), // 动画执行时间3秒
    )
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController), // 从灰色变成蓝色
              value: _animationController.value,
            ),
          ),
        ],
      ),
    );
  }
}
