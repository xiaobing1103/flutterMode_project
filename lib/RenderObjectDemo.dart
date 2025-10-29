import 'package:flutter/material.dart';

// 使用createRenderObject创建自定义widget
class CustomWidget extends LeafRenderObjectWidget {
  const CustomWidget({
    super.key,
    this.size = 80,
    this.color = Colors.blue,
    this.borderRadius = 12,
  });

  final double size;
  final Color color;
  final double borderRadius;

  @override
  RenderCustomObject createRenderObject(BuildContext context) {
    return RenderCustomObject()
      ..side = size
      ..color = color
      ..borderRadius = borderRadius;
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderCustomObject renderObject) {
    renderObject
      ..side = size
      ..color = color
      ..borderRadius = borderRadius;
  }
}

class RenderCustomObject extends RenderBox {
  double _side = 80;
  Color _color = Colors.blue;
  double _borderRadius = 12;

  set side(double value) {
    if (_side == value) return;
    _side = value;
    markNeedsLayout();
  }

  set color(Color value) {
    if (_color == value) return;
    _color = value;
    markNeedsPaint();
  }

  set borderRadius(double value) {
    if (_borderRadius == value) return;
    _borderRadius = value;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    size = constraints.constrain(Size.square(_side));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final paint = Paint()..color = _color;
    final rect = offset & size;
    final rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(_borderRadius),
    );
    canvas.drawRRect(rRect, paint);
  }
}

class RenderObjectDemo extends StatelessWidget {
  const RenderObjectDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RenderObject Demo'),
      ),
      body: const Center(
        child: CustomWidget(
          size: 200,
          color: Color.fromARGB(255, 154, 221, 31),
          borderRadius: 20,
        ),
      ),
    );
  }
}
