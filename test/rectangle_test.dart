
void testRectangle() {  
  group('testRectangle', () {    
    test('testRectangleCopyConstructor', testRectangleCopyConstructor); 
    test('testRectangleContainsItself', testRectangleContainsItself);    
    test('testRectangleIntersectsItself', testRectangleIntersectsItself);    
    test('testRectangleWithOnePixelLessHeightDoesNotContain', testRectangleWithOnePixelLessHeightDoesNotContain);  
    test('testRectangleWithSubPixelLessHeightDoesNotContain', testRectangleWithSubPixelLessHeightDoesNotContain);
    test('testRectangleWithOnePixelLessWidthDoesNotContain', testRectangleWithOnePixelLessWidthDoesNotContain);
    test('testRectangleWithSubPixelLessWidthDoesNotContain', testRectangleWithSubPixelLessWidthDoesNotContain);
    test('testRectanglesWithOnePixelOverlapIntersect', testRectanglesWithOnePixelOverlapIntersect);   
    test('testRectanglesWithSubPixelOverlapIntersect', testRectanglesWithSubPixelOverlapIntersect);
    test('testRectanglesLeftRightTouchingDoNotIntersect', testRectanglesLeftRightTouchingDoNotIntersect);
    test('testRectanglesTopBottomTouchingDoNotIntersect', testRectanglesTopBottomTouchingDoNotIntersect);
    test('testRectanglesIntersectToEmpty', testRectanglesIntersectToEmpty);
    test('testRectanglesIntersectTo', testRectanglesIntersectTo);
    test('testRectanglesIntersect', testRectanglesIntersect);
    test('testRectangleIntersectionConstructor', testRectangleIntersectionConstructor);
    test('testRectangleInflate', testRectangleInflate);
    test('testRectangleIsEmpty', testRectangleIsEmpty);
    test('testRectangleEmptyConstructor', testRectangleEmptyConstructor);
    test('testRectangleRound', testRectangleRound);
    test('testRectangleRoundTo', testRectangleRoundTo);
    test('testRectangleRoundedConstructor', testRectangleRoundedConstructor);
    test('testRectangleTranslate', testRectangleTranslate);
    test('testRectangleUniteTo', testRectangleUniteTo);
    test('testRectangleUnite', testRectangleUnite);
    test('testRectangleUnionConstructor', testRectangleUnionConstructor);
    test('testRectangleEquals', testRectangleEquals);
    test('testRectangleToString', testRectangleToString);
  });
}

void testRectangleCopyConstructor() {
  var from = new Rectangle(1, 2, 3, 4);
  var to = new Rectangle.copy(from);
  expect(from.left, equals(to.left));
  expect(from.top, equals(to.top));
  expect(from.width, equals(to.width));
  expect(from.height, equals(to.height));
  expect(identical(from, to), isFalse);
}

void testRectangleContainsItself() {
  var r = new Rectangle(10.1, 3.14, 7, 19);
  expect(r.contains(r), isTrue);
}

void testRectangleIntersectsItself() {
  var r = new Rectangle(0.12345, 0, 20.678, 99);
  expect(r.intersects(r), isTrue);
}

void testRectangleWithOnePixelLessHeightDoesNotContain() {
  var r1 = new Rectangle(0, 0, 10, 10);
  var r2 = new Rectangle(0, 0, 10, 9);
  expect(r2.contains(r1), isFalse);
}

void testRectangleWithSubPixelLessHeightDoesNotContain() {
  var r1 = new Rectangle(0.0, 0.0, 10.0, 10.0);
  var r2 = new Rectangle(0.0, 0.0, 10.0, 9.9999);
  expect(r2.contains(r1), isFalse);
}

void testRectangleWithOnePixelLessWidthDoesNotContain() {
  var r1 = new Rectangle(14, 60, 1000000, 2000);
  var r2 = new Rectangle(14, 60, 999999, 2000);
  expect(r2.contains(r1), isFalse);
}

void testRectangleWithSubPixelLessWidthDoesNotContain() {
  var r1 = new Rectangle(14.0, 60.0, 1000000.0, 2000.0);
  var r2 = new Rectangle(14.0, 60.0, 999999.9999, 2000.0);
  expect(r2.contains(r1), isFalse);
}

void testRectanglesWithOnePixelOverlapIntersect() {
  var r1 = new Rectangle(0, 0, 9, 9);
  var r2 = new Rectangle(8, 8, 100, 100);
  expect(r1.intersects(r2), isTrue);
  expect(r2.intersects(r1), isTrue);
}

void testRectanglesWithSubPixelOverlapIntersect() {
  var r1 = new Rectangle(0.0, 0.0, 9.0, 9.0);
  var r2 = new Rectangle(8.9999, 8.9999, 100.0, 100.0);
  expect(r1.intersects(r2), isTrue);
  expect(r2.intersects(r1), isTrue);
}

void testRectanglesLeftRightTouchingDoNotIntersect() {
  var r1 = new Rectangle(10, 0, 10, 10);
  var r2 = new Rectangle(20, 0, 10, 10);
  expect(r1.intersects(r2), isFalse);
  expect(r2.intersects(r1), isFalse);
  var rd1 = new Rectangle(10.12345, 0.0, 10.0, 10.0);
  var rd2 = new Rectangle(20.12345, 0.0, 10.0, 10.0);
  expect(rd1.intersects(rd2), isFalse);
  expect(rd2.intersects(rd1), isFalse);
}

void testRectanglesTopBottomTouchingDoNotIntersect() {
  var r1 = new Rectangle(0, 0, 10, 10);
  var r2 = new Rectangle(0, 10, 10, 10);
  expect(r1.intersects(r2), isFalse);
  expect(r2.intersects(r1), isFalse);
  var rd1 = new Rectangle(0.0, 0.0, 10.0, 10.413);
  var rd2 = new Rectangle(0.0, 10.413, 10.0, 10.0);
  expect(rd1.intersects(rd2), isFalse);
  expect(rd2.intersects(rd1), isFalse);
}

void testRectanglesIntersectToEmpty() {
  var r1 = new Rectangle(10.12345, 0.0, 10.0, 10.0);
  var r2 = new Rectangle(20.12345, 0.0, 10.0, 10.0);
  var result = new Rectangle.empty();
  expect(r1.intersectTo(r2, result), isFalse);
  expect(result.isEmpty);
}

void testRectanglesIntersectTo() {
  var r1 = new Rectangle(0, 0, 9, 9);
  var r2 = new Rectangle(8, 8, 100, 100);
  var result = new Rectangle.empty();
  expect(r1.intersectTo(r2, result), isTrue);
  expect(result.left, equals(8));
  expect(result.top, equals(8));
  expect(result.right, equals(9));
  expect(result.bottom, equals(9));
  expect(result.width, equals(1));
  expect(result.height, equals(1));
  expect(r1.left, equals(0));
  expect(r1.top, equals(0));
  expect(r1.right, equals(9));
  expect(r1.bottom, equals(9));
  expect(r1.width, equals(9));
  expect(r1.height, equals(9));
  expect(r2.left, equals(8));
  expect(r2.top, equals(8));
  expect(r2.right, equals(108));
  expect(r2.bottom, equals(108));
  expect(r2.width, equals(100));
  expect(r2.height, equals(100));
}

void testRectanglesIntersect() {
  var r1 = new Rectangle(0, 0, 9, 9);
  var r2 = new Rectangle(8, 8, 100, 100);
  expect(r1.intersect(r2), isTrue);
  expect(r1.left, equals(8));
  expect(r1.top, equals(8));
  expect(r1.right, equals(9));
  expect(r1.bottom, equals(9));
  expect(r1.width, equals(1));
  expect(r1.height, equals(1));
  expect(r2.left, equals(8));
  expect(r2.top, equals(8));
  expect(r2.right, equals(108));
  expect(r2.bottom, equals(108));
  expect(r2.width, equals(100));
  expect(r2.height, equals(100));
}

void testRectangleIntersectionConstructor() {
  var r1 = new Rectangle(0, 0, 9, 9);
  var r2 = new Rectangle(8, 8, 100, 100);
  var result = new Rectangle.intersection(r1, r2);
  expect(result.left, equals(8));
  expect(result.top, equals(8));
  expect(result.right, equals(9));
  expect(result.bottom, equals(9));
  expect(result.width, equals(1));
  expect(result.height, equals(1));
}

void testRectangleInflate() {
  var r = new Rectangle(1, 2, 3, 4);
  r.inflate(2, 3.14);
  expect(r.left, equals(-1));
  expect(r.right, equals(6));
  expect(r.width, equals(7));
  expect(r.top, closeTo(-1.14, tolerance));
  expect(r.bottom, closeTo(9.14, tolerance));
  expect(r.height, closeTo(10.28, tolerance)); 
}

void testRectangleIsEmpty() {
  var r = new Rectangle(1, 2, 0, 0);
  expect(r.isEmpty);
  r.width = 2;
  expect(r.isEmpty, isFalse);
  r.width = 0;
  expect(r.isEmpty);
  r.height = 0.001;
  expect(r.isEmpty, isFalse);
}

void testRectangleEmptyConstructor() {
  var r = new Rectangle.empty();
  expect(r.left, equals(0));
  expect(r.top, equals(0));
  expect(r.right, equals(0));
  expect(r.bottom, equals(0));
  expect(r.width, equals(0));
  expect(r.height, equals(0));
}

void testRectangleRound() {
  var r = new Rectangle(1.2, 1.2, 2.4, 2.2);
  r.round();
  expect(r.left, equals(1));
  expect(r.top, equals(1));
  expect(r.right, equals(4));
  expect(r.bottom, equals(3));
  expect(r.width, equals(3));
  expect(r.height, equals(2));
}

void testRectangleRoundTo() {
  var r = new Rectangle(1.2, 1.2, 2.4, 2.2);
  var result = new Rectangle.empty();
  r.roundTo(result);
  expect(r.left, equals(1.2));
  expect(r.top, equals(1.2));
  expect(r.right, closeTo(3.6, tolerance));
  expect(r.bottom, closeTo(3.4, tolerance));
  expect(r.width, equals(2.4));
  expect(r.height, equals(2.2));
  expect(result.left, equals(1));
  expect(result.top, equals(1));
  expect(result.right, equals(4));
  expect(result.bottom, equals(3));
  expect(result.width, equals(3));
  expect(result.height, equals(2));
}

void testRectangleRoundedConstructor() {
  var r = new Rectangle(1.2, 1.2, 2.4, 2.2);
  var result = new Rectangle.rounded(r);
  expect(r.left, equals(1.2));
  expect(r.top, equals(1.2));
  expect(r.right, closeTo(3.6, tolerance));
  expect(r.bottom, closeTo(3.4, tolerance));
  expect(r.width, equals(2.4));
  expect(r.height, equals(2.2));
  expect(result.left, equals(1));
  expect(result.top, equals(1));
  expect(result.right, equals(4));
  expect(result.bottom, equals(3));
  expect(result.width, equals(3));
  expect(result.height, equals(2));
}

void testRectangleTranslate() {
  var r = new Rectangle(1, 2, 3, 4);
  r.translate(5, 3.14);
  expect(r.left, equals(6));
  expect(r.right, equals(9));
  expect(r.width, equals(3));
  expect(r.top, closeTo(5.14, tolerance));
  expect(r.bottom, closeTo(9.14, tolerance));
  expect(r.height, closeTo(4, tolerance)); 
}

void testRectangleUniteTo() {
  var r1 = new Rectangle(10, 10, 10, 10);
  var r2 = new Rectangle(20, 20, 10, 10);
  var result = new Rectangle.empty();
  r1.uniteTo(r2, result);
  expect(result.left, equals(10));
  expect(result.top, equals(10));
  expect(result.right, equals(30));
  expect(result.bottom, equals(30));
  expect(result.width, equals(20));
  expect(result.height, equals(20));
  expect(r1.left, equals(10));
  expect(r1.top, equals(10));
  expect(r1.right, equals(20));
  expect(r1.bottom, equals(20));
  expect(r1.width, equals(10));
  expect(r1.height, equals(10));
  expect(r2.left, equals(20));
  expect(r2.top, equals(20));
  expect(r2.right, equals(30));
  expect(r2.bottom, equals(30));
  expect(r2.width, equals(10));
  expect(r2.height, equals(10));
}

void testRectangleUnite() {
  var r1 = new Rectangle(10, 10, 10, 10);
  var r2 = new Rectangle(20, 20, 10, 10);
  r1.unite(r2);
  expect(r1.left, equals(10));
  expect(r1.top, equals(10));
  expect(r1.right, equals(30));
  expect(r1.bottom, equals(30));
  expect(r1.width, equals(20));
  expect(r1.height, equals(20));
  expect(r2.left, equals(20));
  expect(r2.top, equals(20));
  expect(r2.right, equals(30));
  expect(r2.bottom, equals(30));
  expect(r2.width, equals(10));
  expect(r2.height, equals(10));
}

void testRectangleUnionConstructor() {
  var r1 = new Rectangle(10, 10, 10, 10);
  var r2 = new Rectangle(20, 15.5, 10, 14.5);
  var result = new Rectangle.union(r1, r2);
  expect(result.left, equals(10));
  expect(result.top, equals(10));
  expect(result.right, equals(30));
  expect(result.bottom, equals(30));
  expect(result.width, equals(20));
  expect(result.height, equals(20));
}

void testRectangleEquals() {
  var x = new Rectangle(1, 2, 3, 4);
  var y = new Rectangle(1, 2, 3, 4);
  var z = new Rectangle(1.0, 2.0, 3.0, 4.0);
  expect(x, isNot(equals(null)));
  expect(x, equals(x));
  expect(x, equals(y));
  expect(y, equals(x));
  expect(y, equals(z));
  expect(x, equals(z));
  expect(x.hashCode(), equals(y.hashCode()));
  expect(y.hashCode(), equals(z.hashCode()));
  expect(x.hashCode(), equals(z.hashCode()));
  var w = new Rectangle(-1, 2, 3, 4);
  expect(x, isNot(equals(w)));
  expect(w, isNot(equals(x)));
  expect(w.hashCode(), isNot(equals(x.hashCode())));
  w = new Rectangle(1, -2, 3, 4);
  expect(w, isNot(equals(x)));
  expect(w.hashCode(), isNot(equals(x.hashCode())));
  w = new Rectangle(1, 2, -3, 4);
  expect(w, isNot(equals(x)));
  expect(w.hashCode(), isNot(equals(x.hashCode())));
  w = new Rectangle(1, 2, 3, -4);
  expect(w, isNot(equals(x)));
  expect(w.hashCode(), isNot(equals(x.hashCode())));
}

void testRectangleToString() {
  var r = new Rectangle(1, 2, 3.0, 4.0);
  expect(r.toString(), equals("rectangle(1,2,3.0,4.0)"));
}
