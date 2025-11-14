import 'package:flutter/material.dart';

class Exemplewrap1 extends StatelessWidget {
  final List<Widget> _children = [
    Container(
      width: 80.0,
      height: 80.0,
      color: Colors.red,
    ),
    Container(
      width: 80.0,
      height: 80.0,
      color: Colors.green,
    ),
    Container(
      width: 80.0,
      height: 80.0,
      color: Colors.blue,
    ),
    Container(
      width: 80.0,
      height: 80.0,
      color: Colors.yellow,
    ),
    Container(
      width: 60.0,
      height: 80.0,
      color: Colors.brown,
    ),
    CreateSquare(
      width: 80.0,
      height: 80.0,
      color: Colors.purple,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: _children,
    );
  }
}

class CreateSquare extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CreateSquare({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        color: color,
      );
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  // print('打印margin的值  $margin');
  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    print('函数区间打印x的值  $x');
    var y = margin.top;

    print('函数区间打印y的值  $y');
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      // debugger();
      var w = context.getChildSize(i)!.width + x + margin.right;
      print('打印w的值  $w');
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
        print('打印x的值  $x');
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度尽可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
