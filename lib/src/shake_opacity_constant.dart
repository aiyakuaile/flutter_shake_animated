import 'package:flutter/widgets.dart';
import 'shake_constant.dart';

class ShakeOpacityConstant implements ShakeConstant {
  @override
  List<int> get interval => [10];

  @override
  List<double> get opacity =>
      const [1.0, 0.08, 0.13, 0.07, 0.17, 0.43, 0.02, 0.06, 0.94, 0.8, 0];

  @override
  List<double> get rotate =>
      const [0, 0.5, 2.5, 1.5, 0.5, -1.5, 1.5, 2.5, 2.5, -0.5, 0];

  @override
  List<Offset> get translate => const [
        Offset(0, 0),
        Offset(-4, -1),
        Offset(3, 3),
        Offset(5, 1),
        Offset(-2, 0),
        Offset(0, 4),
        Offset(1, 1),
        Offset(3, 2),
        Offset(-4, 4),
        Offset(3, -4),
        Offset(0, 0)
      ];

  @override
  Duration get duration => const Duration(milliseconds: 500);
}
