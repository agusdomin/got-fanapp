import 'package:flutter/material.dart';

class CustomIndicadorTabbar extends Decoration {
  final BoxPainter _painter;

  CustomIndicadorTabbar({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    double width = cfg.size?.width ?? 1;
    double height = cfg.size?.height ?? 1;

    final Offset? circleOffset;
    circleOffset = offset + Offset(width / 2, height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
