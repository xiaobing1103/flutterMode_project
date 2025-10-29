import 'package:flutter/material.dart';

class ProductVariant {
  const ProductVariant({
    required this.name,
    required this.swatch,
    required this.price,
    required this.features,
  });

  final String name;
  final Color swatch;
  final double price;
  final List<String> features;

  String get formattedPrice => '¥${price.toStringAsFixed(0)}';
}

class ProductVariantDemo extends StatefulWidget {
  const ProductVariantDemo({super.key});

  @override
  State<ProductVariantDemo> createState() => _ProductVariantDemoState();
}

class _ProductVariantDemoState extends State<ProductVariantDemo> {
  static const List<ProductVariant> _variants = [
    ProductVariant(
      name: '标准款',
      swatch: Color(0xFF1565C0),
      price: 2999,
      features: ['64GB 存储', '单镜头', '塑料机身'],
    ),
    ProductVariant(
      name: '青春款',
      swatch: Color(0xFF2E7D32),
      price: 3299,
      features: ['128GB 存储', '双镜头', '金属机身'],
    ),
    ProductVariant(
      name: '旗舰款',
      swatch: Color(0xFFAD1457),
      price: 3999,
      features: ['256GB 存储', '三镜头', '陶瓷机身'],
    ),
  ];

  ProductVariant _selected = _variants.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('产品变体示例')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownMenu<ProductVariant>(
              initialSelection: _selected,
              width:  double.infinity,
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              onSelected: (variant) {
                if (variant == null) return;
                setState(() => _selected = variant);
              },
              dropdownMenuEntries: _variants
                  .map(
                    (variant) => DropdownMenuEntry<ProductVariant>(
                      value: variant,
                      label: variant.name,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: _selected.swatch.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _selected.swatch, width: 2),
              ),
              alignment: Alignment.center,
              child: Text(
                _selected.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: _selected.swatch),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('售价：', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(_selected.formattedPrice),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '主要特性',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ..._selected.features.map(
              (feature) => ListTile(
                dense: true,
                leading: const Icon(Icons.check_circle_outline, size: 20),
                title: Text(feature),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
