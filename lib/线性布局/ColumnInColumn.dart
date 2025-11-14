import 'package:flutter/material.dart';

class ColumnInColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: <Widget>[
            // 如果要让里面的Column占满外部Column，可以使用Expanded 组件：
            // Expanded(
            // child:
            Container(
              color: Colors.red,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                children: <Widget>[
                  Text("hello world "),
                  Text("I am Jack "),
                ],
              ),
            )
            // )
          ],
        ),
      ),
    );
  }
}
