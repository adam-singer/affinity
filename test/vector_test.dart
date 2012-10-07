
void testVector2() {  
  group('testVector2', () {    
    test('testVector2Length', testVector2Length);
    test('testVector2LerpTo', testVector2LerpTo);
    test('testVector2Lerp', testVector2Lerp);
    test('testVector2NormalizeTo', testVector2NormalizeTo);
    test('testVector2Normalize', testVector2Normalize);
    test('testVector2Equals', testVector2Equals);
    test('testVector2ToString', testVector2ToString);
  });
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
