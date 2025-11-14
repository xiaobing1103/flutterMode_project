import 'package:flutter/material.dart';
import './CenterColumnRoute.dart' show CenterColumnRoute;

class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          width: double.infinity,
          child: const Center(
            child: Text(
              '所谓线性布局，即指沿水平或垂直方向排列子组件。Flutter 中通过Row和Column来实现线性布局，类似于Android 中的LinearLayout控件。Row和Column都继承自Flex，我们将在弹性布局一节中详细介绍Flex',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Row(
            textDirection: TextDirection.rtl,
            // 表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，
            //此时无论子 widgets 实际占用多少水平空间，
            //Row的宽度始终等于水平方向的最大宽度；
            //而MainAxisSize.min表示尽可能少的占用水平空间，当子组件没有占满水平剩余空间，
            // mainAxisSize: MainAxisSize.min,

            /*
            表示子组件在Row所占用的水平空间内对齐方式，
            如果mainAxisSize值为MainAxisSize.min，则此属性无意义，
            因为子组件的宽度等于Row的宽度。只有当mainAxisSize的值为MainAxisSize.max时，
            此属性才有意义，MainAxisAlignment.start表示沿textDirection的初始方向对齐，
            如textDirection取值为TextDirection.ltr时，则MainAxisAlignment.start表示左对齐，
            textDirection取值为TextDirection.rtl时表示从右对齐。而MainAxisAlignment.end
            和MainAxisAlignment.start正好相反；MainAxisAlignment.center表示居中对齐。
            读者可以这么理解：textDirection是mainAxisAlignment的参考系。
            */
            // 类似flex的justify-content
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // 表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
            verticalDirection: VerticalDirection.up,
            /**
               * 表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度，
               * 它的取值和MainAxisAlignment一样(包含start、end、 center三个值)，不同的是
               * crossAxisAlignment的参考系是verticalDirection，即verticalDirection值为
               * VerticalDirection.down时crossAxisAlignment.start指顶部对齐，
               * verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start
               * 指底部对齐；而crossAxisAlignment.end和crossAxisAlignment.start正好相反
               */
            //类似flex的align-items
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Container(
                  // alignment: Alignment.center,
                  color: Colors.yellow,
                  child: Text('左文本'),
                ),
              ),
              Text('左侧文本'),
              Text('左侧文本'),
            ]),
        Container(
          color: Colors.green,
          height: 100,
          width: double.infinity,
          child: const Center(
            child: Text(
              '绿色容器',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          height: 100,
          width: double.infinity,
          child: const Center(
            child: Text(
              '蓝色容器',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        Column(
          //测试Row对齐方式，排除Column默认居中对齐的干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(
                  " hello world ",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(" I am Jack "),
              ],
            ),
            CenterColumnRoute(),
          ],
        )
      ],
    );
  }
}
