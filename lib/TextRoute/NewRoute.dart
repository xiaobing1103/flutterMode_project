import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:my_app/CommonWidget/MyIcon.dart';

class NewRoute extends StatelessWidget {
  const NewRoute({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments;
    String icons = "";
// accessible: 0xe03e
    icons += "\uE03e";
// error:  0xe237
    icons += " \uE237";
// fingerprint: 0xe287
    icons += " \uE287";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'ZhiMangXing',
            fontSize: 12,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RandomWordsWidget(),
              const SizedBox(height: 20),
              Text('This is a new route with arguments: $arguments',
                  style: const TextStyle(
                    fontFamily: 'LiuJianMaoCao',
                    fontSize: 20,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(MyIcons.QQIcon,
                            color: const Color.fromARGB(255, 52, 165, 235)),
                        Icon(MyIcons.wechat, color: Colors.green),
                        Icon(MyIcons.DingIcon,
                            color: const Color.fromARGB(255, 24, 187, 199)),
                        Icon(MyIcons.shenDa,
                            color: const Color.fromARGB(255, 228, 56, 145),
                            size: 100.0),
                      ],
                    ),
                    // Image(
                    //   image: NetworkImage(
                    //       "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                    //   width: 100.0,
                    // ),
                    // fit 参数 示例参考这个 https://book.flutterchina.club/assets/img/3-12.3ae1737a.png
                    Text(
                      icons,
                      style: TextStyle(
                        fontFamily: "MaterialIcons",
                        fontSize: 24.0,
                        color: Colors.green,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.accessible, color: Colors.green),
                        Icon(Icons.error, color: Colors.green),
                        Icon(Icons.fingerprint, color: Colors.green),
                      ],
                    ),
                    Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.none,
                      width: 40.0,
                    ),
                    Image(
                      image: AssetImage("images/avatar.png"),
                      width: 70.0,
                      color: Colors.blue,
                      colorBlendMode: BlendMode.difference,
                    ),
                    Image(
                      image: AssetImage("images/avatar.png"),
                      width: 100.0,
                      height: 200.0,
                      repeat: ImageRepeat.repeatY,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 105, 104, 104),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed('product_variant_demo'),
                      icon: const Icon(Icons.send),
                      label: const Text(
                        "防守打法都是",
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 200, 214, 247),
                        textStyle: const TextStyle(
                          fontFamily: 'ZhiMangXing',
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("防守打法都是地方"),
                    ),
                    TextButton.icon(
                        icon: Icon(Icons.info),
                        onPressed: () =>
                            {Navigator.of(context).pushNamed('textfield_test')},
                        label: Text('去文本输入框示例页面')),
                    OutlinedButton.icon(
                        icon: Icon(Icons.add),
                        onPressed: () =>
                            {Navigator.of(context).pushNamed('FormTest')},
                        label: Text('进入From表单学习页面')),
                    IconButton(onPressed: () => {}, icon: Icon(Icons.add))
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

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}
