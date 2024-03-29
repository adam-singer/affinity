
library affinity_test;

import 'dart:math';
import 'package:unittest/unittest.dart';
import 'package:affinity/affinity.dart';

part 'affine_transform_test.dart';
part 'rectangle_test.dart';
part 'vector_test.dart';

double tolerance = 0.000000001;

void main() {  
  testAffineTransform();
  testRectangle();
  testVector2();
}
