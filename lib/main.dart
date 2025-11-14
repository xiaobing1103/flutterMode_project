// 诊断提示：如果运行时出现 "java.net.ConnectException: Connection timed out: connect"
// 可能原因：Gradle/工具尝试联网下载依赖或连接远程服务被阻塞（网络、代理、防火墙等）。
// 快速排查步骤：
// 1) 运行 `flutter doctor -v` 和 `flutter run -v` 查看详细日志。
// 2) 使用 `adb devices` 确认设备是否已连接。
// 3) 检查是否在公司网络或需要代理，如果需要，在 android/gradle.properties 或 ~/.gradle/gradle.properties 配置 systemProp.http/https.proxyHost/Port。
// 4) 检查防火墙或杀毒软件是否阻止 Java/Gradle 网络访问。
// 5) 运行 `flutter clean`、`flutter pub get` 后重试。
// 如仍有问题，请贴出 `flutter run -v` 的完整输出以便进一步分析。
//
// 诊断提示：如果遇到 "Timeout waiting to lock journal cache"（journal-1.lock 被占用）
// 解决步骤（按顺序）:
// 1) 在 android 目录运行：gradlew.bat --stop
// 2) 检查是否有其他 Gradle/IDE/CI 进程占用：tasklist | findstr java
//    若确认 Owner PID（例如报错中显示的 Owner PID: 8472），可终止：taskkill /PID 8472 /F
// 3) 等原进程退出后再删除锁文件（仅在确认没有 Gradle/Java 进程时删除）：
//    del %USERPROFILE%\.gradle\caches\journal-1\journal-1.lock
// 4) 如无法删除，重启电脑（可安全清理占用）
// 5) 避免并发构建：不要同时在多个终端/IDE 启动构建；将杀毒/备份软件排除 .gradle 目录
// 6) 常用命令：cd android && gradlew.bat --stop && flutter clean && flutter pub get && flutter run -v
// 如果仍有问题，请贴出 gradlew --status、tasklist 输出和错误日志以便进一步诊断。

import 'package:flutter/material.dart';
import 'package:my_app/Wrap/TestWrap.dart';
import './TextRoute/NewRoute.dart';
import './TextRoute/TipRoute.dart';
import 'StateLifecycleTest.dart';
import 'GetStateObjectRoute.dart';
import 'RenderObjectDemo.dart';
import 'cupertino.dart';
import 'TapBoxA.dart';
import 'parentTapBox/TapBoxb.dart';
import 'parentTaoBox2/ParentWidgetC.dart';
import 'model_variant_demo.dart';
import 'TextField/TextFieldTest.dart';
import 'Form/FormTest.dart';
import 'LinearProgressIndicator/TestLine.dart';
import 'ConstrainedBox/ConstrainedBoxTest.dart';
import '线性布局/XianXing.dart';
import 'Flex/OutPut.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String? routeName = settings.name;
          print(routeName);

          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其他情况则正常打开路由。
          // 默认返回一个空页面，避免返回 null
          return const SizedBox.shrink();
        });
      },
      title: '边界页面',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/new_page': (context) => const NewRoute(title: '新的页面'),
        'TestLine': (context) => const TestLine(),
        "/": (context) => const MyHomePage(title: 'Flutter初始页面'),
        "tip2": (context) {
          return TipRoute(
              text: (ModalRoute.of(context)!.settings.arguments as String));
        },
        'product_variant_demo': (context) => const ProductVariantDemo(),
        'textfield_test': (context) => Textfieldtest(),
        'FormTest': (context) => const FormTest(),
        'ConstrainedBoxTest': (context) => ConstrainedBoxTest(),
        'XianXing': (context) => XianXing(),
        'flex_output': (context) => const Output(),
        'OutPutWarp': (context) => const OutPutWarp(),
      },
      // home: MyHomePage(title: '测试项目'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget showTitle = Text('${widget.title} - 你好 Flutter');
    return Scaffold(
      appBar: AppBar(
        title: showTitle,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyAnimatedBox(), // 使用自定义的带动画控制器的组件
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('ConstrainedBoxTest');
              },
              child: Text('点击进入ConstrainedBox 示例:'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('OutPutWarp');
              },
              child: Echo(text: 'Hello, Echo11!'),
            ), // 使用 Echo 组件
            // ContextRoute(),

            ElevatedButton(
              onPressed: () async {
                // Navigator.of(context).push(
                //   // 错误示例（不能这样写 —— 这是构造函数签名，不是调用）:
                //   // MaterialPageRoute({
                //   //   WidgetBuilder builder,
                //   //   RouteSettings settings,
                //   //   bool maintainState = true,
                //   //   bool fullscreenDialog = false,
                //   // })
                //   //
                //   // 原因：
                //   // 1) 在调用处不能写参数类型/默认值；那种格式只会出现在类内部定义构造函数时。
                //   // 2) 你需要的是调用：提供各命名参数的值。
                //   // 3) builder 是必需的（required WidgetBuilder builder），必须传入一个函数。
                //   //
                //   // 正确调用示例（可选传其它参数）:
                //   MaterialPageRoute(
                //     builder: (context) => const StateLifecycleTest(),
                //     settings: const RouteSettings(name: 'StateLifecycleTest'),
                //     maintainState: false,
                //     fullscreenDialog: true,
                //   ),
                // );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) {
                //     return NewRoute();
                //   }),
                // );
                //
                //非命名路由的跳转并等待返回值
                // final result = await Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) {
                //     return const TipRoute(text: '我是提');
                //   }),
                // );
                final result = await Navigator.pushNamed(context, '/new_page',
                    arguments: "牛的43543543比");
                print('路由返回值: $result');
              },
              child: const Text('打开 路由测试 页面 1'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //           builder: (context) => const GetStateObjectRoute()),
            //     );
            //   },
            //   child: const Text('打开 GetStateObjectRoute 页面'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const RenderObjectDemo()),
                );
              },
              child: const Text('打开 RenderObject 页面'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const CupertinoTestRoute()),
                );
              },
              child: const Text('打开 CupertinoTestRoute 页面'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Tapboxa(),
                  ),
                );
              },
              child: const Text('打开 Tapboxa 页面'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ParentWidget(),
                  ),
                );
              },
              child: const Text('打开 Tapboxb 页面'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ParentWidgetC(),
                  ),
                );
              },
              child: const Text('打开 Tapboxc 页面'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pushNamed('product_variant_demo');
            //   },
            //   child: const Text('打开 产品变体 示例'),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// 一个抽象的带动画控制器的基类 State，子类只需要实现 build 方法
abstract class BaseAnimatedWidget extends StatefulWidget {
  const BaseAnimatedWidget({super.key});
}

abstract class BaseAnimatedWidgetState<T extends BaseAnimatedWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context);
}

class MyAnimatedBox extends BaseAnimatedWidget {
  const MyAnimatedBox({super.key});

  @override
  BaseAnimatedWidgetState<BaseAnimatedWidget> createState() =>
      _MyAnimatedBoxState();
}

class _MyAnimatedBoxState extends BaseAnimatedWidgetState<MyAnimatedBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: controller.drive(Tween(begin: 0.3, end: 1.0)),
        child: Container(width: 50, height: 50, color: Colors.blue),
      ),
    );
  }
}

class Echo extends StatelessWidget {
  const Echo({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.grey, //默认为灰色
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class ContextRoute extends StatelessWidget {
  const ContextRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // 安全方式一：尝试获取父 Scaffold 的 appBar.title（如果存在就直接展示）
    final scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
    final Widget titleWidget = (scaffold != null && scaffold.appBar is AppBar)
        ? ((scaffold.appBar as AppBar).title ?? const SizedBox())
        : const Text('无 AppBar 标题');
    // 同时提供一个按钮演示如何在子组件里使用 ScaffoldMessenger 显示 SnackBar
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          child: Text("open new route"),
          onPressed: () {
            //导航到新路由
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return NewRoute(title: '21321');
              }),
            );
          },
        ),
        // 显示 AppBar 的 title（如果是 Text 会直接显示文本）
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: titleWidget,
        ),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('这是来自   ContextRoute 的 SnackBar')),
            );
          },
          child: const Text('显示 SnackBar'),
        ),
      ],
    );
  }
}
