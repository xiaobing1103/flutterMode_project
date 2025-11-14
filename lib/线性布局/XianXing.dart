import 'package:flutter/material.dart';
import './example1.dart' show Example1;
import './CenterColumnRoute.dart' show CenterColumnRoute;
import './ColumnInColumn.dart' show ColumnInColumn;
class XianXing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('线性布局示例'),
      ),
      body: ColumnInColumn(),
      // SingleChildScrollView(
        // child: Example1(),
        // child: CenterColumnRoute(),
        // child: ColumnInColumn(),
      // ),
    );
  }
}
