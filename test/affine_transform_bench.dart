
part of affinity_bench;

Benchmark affineTransformConcatenate() {
  var tx = new AffineTransform(1, 2, 3, 4, 5, 6);  
  var other = new AffineTransform(2, 1, 6, 5, 4, 3);
  return new Benchmark(() => tx.concatenate(other));
}

Benchmark affineTransformPreconcatenate() {
  var tx = new AffineTransform(1, 2, 3, 4, 5, 6);  
  var other = new AffineTransform(2, 1, 6, 5, 4, 3);
  return new Benchmark(() => tx.preconcatenate(other));
}

Benchmark affineTransformRotate() {    
  var tx = new AffineTransform(1, 2, 3, 4, 5, 6);
  return new Benchmark(() => tx.rotate(PI/4));
}

Benchmark affineTransformRotateAnchor() {    
  var tx = new AffineTransform(1, 2, 3, 4, 5, 6);
  return new Benchmark(() => tx.rotateAnchor(PI/4, 2, 3));
}

Benchmark affineTransformScale() {    
  var tx = new AffineTransform(1, 2, 3, 4, 5, 6);
  return new Benchmark(() => tx.scale(2, 3));
}

Benchmark affineTransformShear() {    
  var tx = new AffineTransform(1, 2, 3, 4, 5, 6);
  return new Benchmark(() => tx.shear(2, 3));
}

Benchmark affineTransformTranslate() {   
  var tx = new AffineTransform(1, 2, 3, 4, 5, 6);
  return new Benchmark(() => tx.translate(2, 3));
}
