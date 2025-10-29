import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class NewRoute extends StatelessWidget {
  const NewRoute({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RandomWordsWidget(),
            SizedBox(height: 20),
            Text('This is a new route with arguments: $arguments'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('product_variant_demo'),
                child: const Text('查看产品变体示例'),
              ),
            ),
          ],
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
