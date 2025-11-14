import 'package:flutter/material.dart';

class Textfieldtest extends StatefulWidget {
  const Textfieldtest({super.key});

  @override
  State<Textfieldtest> createState() => _TextfieldtestState();
}

class _TextfieldtestState extends State<Textfieldtest> {
  TextEditingController _controller =
      TextEditingController(text: "hello world!");
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      print('文本输入框是否获得焦点: ${_focusNode.hasFocus}');
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.value = _controller.value.copyWith(
        selection: TextSelection(
          baseOffset: 6,
          extentOffset: _controller.text.length,
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('文本输入框示例'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      // autofocus: true,

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '普通文本输入框',
                      ),
                      keyboardType: TextInputType.text,
                      maxLength: 25,
                      focusNode: _focusNode,
                      controller: _controller,
                      // maxLines: 5,
                    ),
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _controller,
                      builder: (context, value, _) =>
                          Text('输入框内容: ${value.text}'),
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.info),
                      onPressed: () {
                        print('文本输入框内容: ${_controller.text}');
                        print('文本输入框是否获得焦点: ${_focusNode.hasFocus}');
                      },
                      label: const Text('获取文本输入框内容'),
                    ),
                    TextField(
                      autofocus: true,
                      onChanged: (value) {
                        print('文本变化内容: $value');
                      },
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或邮箱",
                          prefixIcon: Icon(Icons.person)),
                    ),
                    TextField(
                      focusNode: _focusNode2,
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                    ),
                    // 主题 更改label和hint的颜色
                    Theme(
                        data: Theme.of(context).copyWith(
                            hintColor: Colors.grey[200], //定义下划线颜色
                            inputDecorationTheme: InputDecorationTheme(
                                labelStyle:
                                    TextStyle(color: Colors.grey), //定义label字体样式
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0) //定义提示文本样式
                                )),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                  labelText: "用户名",
                                  hintText: "用户名或邮箱",
                                  prefixIcon: Icon(Icons.person)),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: "密码",
                                  hintText: "您的登录密码",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 13.0)),
                              obscureText: true,
                            )
                          ],
                        )),
                    // 隐藏下划线然后自定义下划线
                    Container(
                      decoration: BoxDecoration(
                          // 下滑线浅灰色，宽度1像素
                          border: Border(
                              bottom: BorderSide(
                                  color: const Color.fromARGB(255, 179, 74, 74),
                                  width: 1.0))),
                      child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "电子邮件地址",
                              prefixIcon: Icon(Icons.email),
                              border: InputBorder.none //隐藏下划线
                              )),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                        child: const Text('移动焦点到下面输入框'),
                        onTap: () {
                          FocusScope.of(context).requestFocus(_focusNode2);
                          // FocusScope.of(context).nextFocus();
                        }),
                    TextButton(
                        onPressed: () {
                          _focusNode.unfocus();
                          _focusNode2.unfocus();
                        },
                        child: const Text('所有键盘收起'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
