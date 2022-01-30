import 'package:flutter/widgets.dart';
import 'shake_constant.dart';

class ShakeCrazyConstant1 implements ShakeConstant {
  @override
  List<int> get interval => [10];

  @override
  List<double> get opacity =>
      [1.0, 0.39, 0.55, 0.55, 0.09, 0.26, 0.23, 0.81, 0.95, 0.16, 0];

  @override
  List<double> get rotate => [0, -1, 6, -5, 9, 2, 2, 9, 5, -6, 0];

  @override
  List<Offset> get translate => const [
        Offset.zero,
        Offset(19, 3),
        Offset(0, 19),
        Offset(15, 20),
        Offset(14, -1),
        Offset(18, 3),
        Offset(1, -3),
        Offset(-7, -17),
        Offset(19, -1),
        Offset(8, -12),
        Offset.zero
      ];

  @override
  Duration get duration => const Duration(milliseconds: 100);
}

class ShakeCrazyConstant2 implements ShakeConstant {
  @override
  List<int> get interval => [10];

  @override
  List<double> get opacity =>
      [1.0, 0.29, 0.31, 0.91, 0.83, 0.58, 0.64, 0.06, 0.89, 0.01, 1.0];

  @override
  List<double> get rotate => [0, -7, 5, 9, -1, -1, -8, 5, 9, -9, 0];

  @override
  List<Offset> get translate => const [
        Offset.zero,
        Offset(10, 3),
        Offset(-8, -8),
        Offset(4, -10),
        Offset(1, -2),
        Offset(19, -6),
        Offset(-10, 20),
        Offset(-11, -18),
        Offset(14, 7),
        Offset(-3, 9),
        Offset.zero
      ];

  @override
  Duration get duration => const Duration(milliseconds: 100);
}
