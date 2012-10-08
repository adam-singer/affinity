
void testVector2() {  
  group('testVector2', () {        
    test('testVector2AddTo', testVector2AddTo);
    test('testVector2Add', testVector2Add);
    test('testVector2SumConstructor', testVector2SumConstructor);
    test('testVector2Distance', testVector2Distance);
    test('testVector2Dot', testVector2Dot);
    test('testVector2Length', testVector2Length);
    test('testVector2LerpTo', testVector2LerpTo);
    test('testVector2Lerp', testVector2Lerp);
    test('testVector2NormalizeTo', testVector2NormalizeTo);
    test('testVector2Normalize', testVector2Normalize);
    test('testVector2NormalConstructor', testVector2NormalConstructor);
    test('testVector2SubtractTo', testVector2SubtractTo);
    test('testVector2Subtract', testVector2Subtract);
    test('testVector2DifferenceConstructor', testVector2DifferenceConstructor);
    test('testVector2Equals', testVector2Equals);
    test('testVector2ToString', testVector2ToString);
  });
}

void testVector2AddTo() {
  var a = new Vector2(1, -1);
  var b = new Vector2(3, 3);
  var result = new Vector2(0, 0);
  a.addTo(b, result);
  expect(result.x, equals(4));
  expect(result.y, equals(2));
  // verify no side effects to original vectors
  expect(a.x, equals(1));
  expect(a.y, equals(-1));
  expect(b.x, equals(3));
  expect(b.y, equals(3));
}

void testVector2Add() {
  var a = new Vector2(1, -1);
  var b = new Vector2(3, 3);
  a.add(b);
  expect(a.x, equals(4));
  expect(a.y, equals(2));
  expect(b.x, equals(3));
  expect(b.y, equals(3));
}

void testVector2SumConstructor() {
  var a = new Vector2(1, -1);
  var b = new Vector2(3, 3);
  var result = new Vector2.sum(a, b);
  expect(result.x, equals(4));
  expect(result.y, equals(2));
  // verify no side effects to original vectors
  expect(a.x, equals(1));
  expect(a.y, equals(-1));
  expect(b.x, equals(3));
  expect(b.y, equals(3));
}

void testVector2Distance() {
  var a = new Vector2(3, 4);
  var b = new Vector2(-3, -4);
  expect(a.distance(b), equals(10));
  expect(a.distanceSquared(b), equals(100));
}

void testVector2Dot() {
  // if the dot product == 0 the vectors are orthogonal.
  var a = new Vector2(0, 5);
  var b = new Vector2(3, 0);
  expect(a.dot(b), isZero);
  // if the dot product > 0, the angle between the two vectors is < 90 degrees.
  a = new Vector2(5, 5);
  b = new Vector2(0, 7);
  expect(a.dot(b), equals(35));
  // if the dot product < 0, the angle between the two vectors is > 90 degrees.
  a = new Vector2(-5, -5);
  b = new Vector2(0, 7);
  expect(a.dot(b), equals(-35));  
  // if the dot product == 1, the angle between the two vectors is 0 degrees;
  //   i.e. the vectors point in the same direction and are parallel.
  a = new Vector2(2, 2)..normalize();
  b = new Vector2(4, 4)..normalize();
  expect(a.dot(b), closeTo(1, tolerance));  
  // if the dot product == -1, the angle between the two vectors is 180 degrees;
  //   i.e. the vectors point in opposite directions and are parallel.
  a = new Vector2(2, 2)..normalize();
  b = new Vector2(-4, -4)..normalize();
  expect(a.dot(b), closeTo(-1, tolerance));
}

void testVector2Length() {
  var v = new Vector2(3.0, 4.0);
  expect(v.length, equals(5.0));
  expect(v.lengthSquared, equals(25.0));
}

void testVector2LerpTo() {
  var a = new Vector2(1, 2);
  var b = new Vector2(2, 1);
  var result = new Vector2(0, 0);
  a.lerpTo(b, 0, result);
  expect(result.x, equals(1));
  expect(result.y, equals(2));
  a.lerpTo(b, 1, result);
  expect(result.x, equals(2));
  expect(result.y, equals(1));
  a.lerpTo(b, 0.5, result);
  expect(result.x, equals(1.5));
  expect(result.y, equals(1.5));  
  // verify no side effects to original vectors
  expect(a.x, equals(1));
  expect(a.y, equals(2));
  expect(b.x, equals(2));
  expect(b.y, equals(1));
}

void testVector2Lerp() {
  var a = new Vector2(1, 2);
  var b = new Vector2(2, 1);
  a.lerp(b, 0.5);
  expect(a.x, equals(1.5));
  expect(a.y, equals(1.5)); 
  expect(b.x, equals(2));
  expect(b.y, equals(1));
}

void testVector2NormalizeTo() {
  var v = new Vector2(3.14, 3.14); // y = x
  var result = new Vector2(0, 0);
  v.normalizeTo(result);
  expect(result.length, closeTo(1.0, tolerance));
  expect(result.x, closeTo(sqrt(0.5), tolerance));
  expect(result.y, closeTo(sqrt(0.5), tolerance));
  expect(v.x, equals(3.14));
  expect(v.y, equals(3.14));
  var v2 = new Vector2(1.12345, 2.2469); // y = 2 * x
  v2.normalizeTo(result);
  expect(result.length, closeTo(1.0, tolerance));
  expect(result.x, closeTo(sqrt(0.2), tolerance));
  expect(result.y, closeTo(2*sqrt(0.2), tolerance));
  expect(v2.x, equals(1.12345));
  expect(v2.y, equals(2.2469));
}

void testVector2Normalize() {
  var v = new Vector2(3.14, 3.14); // y = x
  v.normalize();
  expect(v.length, closeTo(1.0, tolerance));
  expect(v.x, closeTo(sqrt(0.5), tolerance));
  expect(v.y, closeTo(sqrt(0.5), tolerance));
  var v2 = new Vector2(1.12345, 2.2469); // y = 2 * x
  v2.normalize();
  expect(v2.length, closeTo(1.0, tolerance));
  expect(v2.x, closeTo(sqrt(0.2), tolerance));
  expect(v2.y, closeTo(2*sqrt(0.2), tolerance));
}

void testVector2NormalConstructor() {
  var v = new Vector2(3.14, 3.14); // y = x
  var result = new Vector2.normal(v);
  expect(result.length, closeTo(1.0, tolerance));
  expect(result.x, closeTo(sqrt(0.5), tolerance));
  expect(result.y, closeTo(sqrt(0.5), tolerance));
  expect(v.x, equals(3.14));
  expect(v.y, equals(3.14));
}

void testVector2SubtractTo() {
  var a = new Vector2(1, -1);
  var b = new Vector2(3, 3);
  var result = new Vector2(0, 0);
  a.subtractTo(b, result);
  expect(result.x, equals(-2));
  expect(result.y, equals(-4));
  // verify no side effects to original vectors
  expect(a.x, equals(1));
  expect(a.y, equals(-1));
  expect(b.x, equals(3));
  expect(b.y, equals(3));
}

void testVector2Subtract() {
  var a = new Vector2(1, -1);
  var b = new Vector2(3, 3);
  a.subtract(b);
  expect(a.x, equals(-2));
  expect(a.y, equals(-4));
  expect(b.x, equals(3));
  expect(b.y, equals(3));
}

void testVector2DifferenceConstructor() {
  var a = new Vector2(1, -1);
  var b = new Vector2(3, 3);
  var result = new Vector2.difference(a, b);
  expect(result.x, equals(-2));
  expect(result.y, equals(-4));
  // verify no side effects to original vectors
  expect(a.x, equals(1));
  expect(a.y, equals(-1));
  expect(b.x, equals(3));
  expect(b.y, equals(3));
}

void testVector2Equals() {
  var x = new Vector2(1, 2);
  var y = new Vector2(1, 2);
  var z = new Vector2(1.0, 2.0);
  expect(x, isNot(equals(null)));
  expect(x, equals(x));
  expect(x, equals(y));
  expect(y, equals(x));
  expect(y, equals(z));
  expect(x, equals(z));
  expect(x.hashCode(), equals(y.hashCode()));
  expect(y.hashCode(), equals(z.hashCode()));
  expect(x.hashCode(), equals(z.hashCode()));
  var w = new Vector2(-1, 2);
  expect(x, isNot(equals(w)));
  expect(w, isNot(equals(x)));
  expect(w.hashCode(), isNot(equals(x.hashCode())));
  w = new Vector2(1, -2);
  expect(w, isNot(equals(x)));
  expect(w.hashCode(), isNot(equals(x.hashCode())));
}

void testVector2ToString() {
  var v = new Vector2(1, 2);
  expect(v.toString(), equals("vector2(1,2)"));
}
