
/**
 * Represents a vector with 2 components.
 */
class Vector2 {
  
  /// Gets or sets the x-component of the vector.
  num x;
  
  /// Gets or sets the y-component of the vector.
  num y;
  
  /// Calculates the length of the vector.
  num get length => sqrt(x * x + y * y);
  
  /// Calculates the length of the vector squared.
  num get lengthSquared => x * x + y * y;
  
  /// TODO:
  Vector2(this.x, this.y);
  
  /// TODO:
  factory Vector2.unitX() => new Vector2(1, 0);  
  
  /// TODO:
  factory Vector2.unitY() => new Vector2(0, 1);
  
  /// Constructs a new [Vector2] that is the normal of the given [other].
  factory Vector2.normal(Vector2 other) {
    final result = new Vector2(0, 0);
    other.normalizeTo(result);
    return result;
  }
  
  /// Constructs a new [Vector2] that is the sum of the given [a] and [b].
  Vector2.sum(Vector2 a, Vector2 b) : this(a.x + b.x, a.y + b.y);
  
  bool operator ==(Object other) {
    if(this === other) return true;
    if(other is! Vector2) return false; 
    return x == other.x && y == other.y;
  }
  
  int hashCode() => x.hashCode() ^ y.hashCode();
  
  /// Adds in place the given [other] vector to [this] vector.
  void add(Vector2 other) => addTo(other, this);
  
  /// Adds the given [other] vector to [this] vector and writes to [result].
  void addTo(Vector2 other, Vector2 result) {
    result.x = x + other.x;
    result.y = y + other.y;
  }
  
  /// Calculates the distance between [this] vector and the given [other].
  num distance(Vector2 other) {
    final dx = x - other.x;
    final dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
  
  /// Calculates the distance between [this] vector and the [other] squared.
  num distanceSquared(Vector2 other) {
    final dx = x - other.x;
    final dy = y - other.y;
    return dx * dx + dy * dy;
  }
  
  /**
   * Performs a linear interpolation between this [Vector2] and the [other] and
   * writes the result to this vector.  The given [amount] must be a value
   * between [:0:] and [:1:] that indicates the weight of [other]; [:0:] will
   * cause [this] to be unchanged, and [:1:] will cause [other] to be written
   * to [this].
   */
  void lerp(Vector2 other, num amount) => lerpTo(other, amount, this);
  
  /**
   * Performs a linear interpolation between [this] [Vector2] and the [other].
   * The given [amount] must be a value between [:0:] and [:1:] that indicates
   * the weight of [other]; [:0:] will cause [this] to be written to [result],
   * and [:1:] will cause [other] to be written to [result].
   */
  void lerpTo(Vector2 other, num amount, Vector2 result) {
    assert(amount >= 0 && amount <= 1);
    result.x = x + (amount * (other.x - x));
    result.y = y + (amount * (other.y - y));
  }
  
  /// Normalizes this vector in place.
  void normalize() => normalizeTo(this);
  
  /// Normalizes this vector into [result].
  void normalizeTo(Vector2 result) {
    final len = length;
    assert(len > 0);    
    result.x = x/len;
    result.y = y/len;
  }
  
  String toString() => "vector2($x,$y)";
}
