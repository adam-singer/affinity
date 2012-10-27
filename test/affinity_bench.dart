
library affinity_bench;

import 'dart:math';
import 'package:affinity/affinity.dart';
import 'package:bench/bench.dart';
import 'package:logging/logging.dart';

part 'affine_transform_bench.dart';

void main() {
  Logger.root.on.record.add((record) => print('${record.message}'));
  new Benchmarker().run(iterations:100);
}
