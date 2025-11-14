import 'package:flutter/material.dart';

class ConstrainedBoxTest extends StatelessWidget {
  final Widget redBox =
      const DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  ConstrainedBoxTest({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //  SizedBox(
          //     width: 20,
          //     height: 50,
          //     child: CircularProgressIndicator(
          //       strokeWidth: 3,
          //       valueColor: AlwaysStoppedAnimation(Colors.white70),
          //     ),
          //   ),
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
        title: Text(
          'ConstrainedBox 示例',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: Colors.blue,
        shadowColor: Color(0xFF888888),
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
      ),
      body: Column(
        children: <Widget>[
          // 尺寸超出报错
          // UnconstrainedBox(
          //   alignment: Alignment.topLeft,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16),
          //     child: Row(children: [Text('xx' * 30)]),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'ConstrainedBox 组件可以给子组件添加额外的约束条件，从而改变子组件的大小。例如，下面的例子通过 ConstrainedBox 限制了红色盒子的最小宽度和最小高度。',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 60, //宽度尽可能大
                minHeight: 50.0 //最小高度为50像素
                ),
            child: SizedBox(
              height: 80.0,
              width: 80.0,
              child: redBox,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
              child: redBox,
            ),
          ),
          ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
              child: UnconstrainedBox(
                //“去除”父级限制
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 90.0, minHeight: 40.0), //子
                  child: redBox,
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('XianXing');
            },
            child: Text('跳转到线性布局页面',
                style: const TextStyle(
                  fontFamily: 'LiuJianMaoCao',
                  fontSize: 20,
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('flex_output');
            },
            child: Text('跳转到flex布局页面',
                style: const TextStyle(
                  fontSize: 20,
                )),
          ),
        ],
      ),
    );
  }
}
