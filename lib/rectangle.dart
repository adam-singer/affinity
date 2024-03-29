
library rectangle;

/**
 * A representation of a [Rectangle].
 * 
 * Rectangles are endpoint-exclusive.  Endpoint-exclusive rectangles are much 
 * easier to work with, as explained by [Raymond Chen]
 * (http://blogs.msdn.com/b/oldnewthing/archive/2004/02/18/75652.aspx).
 * 
 * For example, the width of a rectangle is (right - left).  If rectangles
 * were endpoint-inclusive, then the width would be (right - left + 1).
 * 
 * Endpoint-exclusive rectangles also scale properly. 
 * 
 * For example, suppose you have two rectangles (0,0)-(100,100) and 
 * (100,100)-(200,200). These two rectangles barely touch at the corner. 
 * Now suppose you magnify these rectangles by 2, so they are now 
 * (0,0)-(200,200) and (200,200)-(400,400). Notice that they still barely 
 * touch at the corner. Also the length of each edge doubled from 100 to 200.
 */
class Rectangle {
  
  /// Gets or sets the x-coordinate of this [Rectangle]'s left edge.
  num left;
  
  /// Gets or sets the y-coordinate of this [Rectangle]'s top edge.
  num top;
  
  /// Gets or sets the width of this [Rectangle].
  num width;
  
  /// Gets or sets the height of this [Rectangle].
  num height;
  
  /**
   * Gets whether this [Rectangle] is empty.  An empty [Rectangle] has [width]
   * and [height] equal to zero.
   */
  bool get isEmpty => width == 0 && height == 0;
  
  /// Gets or sets the x-coordinate of this [Rectangle]'s right edge.
  num get right => left + width;
      set right(num value) { width = value - left; }
  
  /// Gets or sets the y-coordinate of this [Rectangle]'s bottom edge.
  num get bottom => top + height;
      set bottom(num value) { height = value - top; }
  
  /** 
   * Constructs a new [Rectangle] with the given [top]-[left] corner, [width],
   * and [height].
   */
  Rectangle(this.left, this.top, this.width, this.height);
  
  /// Constructs a new [Rectangle] that is a copy of the given [other].
  Rectangle.copy(Rectangle other) 
      : this(other.left, other.top, other.width, other.height);
  
  /// Constructs a new empty [Rectangle].
  Rectangle.empty() : this(0, 0, 0, 0);
  
  /**
   * Constructs a new [Rectangle] representing the intersection of the
   * given [Rectangle]s [a] and [b].
   */
  factory Rectangle.intersection(Rectangle a, Rectangle b) {
    final result = new Rectangle.empty();
    a.intersectTo(b, result);
    return result;
  }
  
  /**
   * Constructs a new [Rectangle] whose [left], [top], [right] and [bottom] 
   * are set to the nearest integer values of the given [other].
   */
  factory Rectangle.rounded(Rectangle other) {
    final result = new Rectangle.empty();
    other.roundTo(result);
    return result;
  }

  /**
   * Constructs a new [Rectangle] representing the union of the given
   * [Rectangle]s [a] and [b].
   */
  factory Rectangle.union(Rectangle a, Rectangle b) {
    final result = new Rectangle.empty();
    a.uniteTo(b, result);
    return result;
  }
  
  bool operator ==(Object other) {
    if(this === other) return true;
    if(other is! Rectangle) return false; 
    return left == other.left && top == other.top 
        && width == other.width && height == other.height;
  }
  
  int get hashCode => left.hashCode ^ top.hashCode
      ^ width.hashCode ^ height.hashCode;
  
  /**
   * Returns [:true:] if the given [other] [Rectangle] is entirely contained
   * within this [Rectangle]; otherwise it returns [:false:].
   */
  bool contains(Rectangle other) => 
      (left <= other.left) && (right >= other.right) && 
      (top <= other.top) && (bottom >= other.bottom);
  
  /**
   * Resizes this [Rectangle] so that it is [w] units larger on both the [left]
   * and [right] side, and [h] units larger at both the [top] and [bottom].  The
   * resulting [Rectangle] has (left - w, top -h) as its upper-left corner,
   * a [width] of (width + 2w) and a [height] of (height + 2h).  If negative 
   * values are supplied, the [Rectangle] decreases accordingly.
   */
  void inflate(num w, num h) {
    left -= w;
    top -= h;
    width += w * 2;
    height += h * 2;
  }
  
  /**
   * Returns [:true:] if this [Rectangle] and the given [other] intersect;
   * otherwise it returns [:false:].
   */
  bool intersects(Rectangle other) => 
      (right > other.left) && (left < other.right) && 
      (bottom > other.top) && (top < other.bottom);    
  
  /**
   * Performs an in place intersection between this [Rectangle] and the [other].
   * If there is no intersection, and [empty] [Rectangle] is written.  Returns
   * [:true:] if there is an intersection, else returns [:false:].
   */
  bool intersect(Rectangle other) => intersectTo(other, this); 
  
  /**
   * Performs an intersection between this [Rectangle] and the [other] and
   * writes it out to the [result].  If there is no intersection, an [empty]
   * [Rectangle] is written to [result].  Returns [:true:] if there is an
   * intersection, else returns [:false:].
   */
  bool intersectTo(Rectangle other, Rectangle result) {
    if(!intersects(other)) {
      result.left = result.top = result.width = result.height = 0;
      return false;
    }
    // store the (calculated) right/bottom values before we change left/top
    final r = right;
    final b = bottom;
    final or = other.right;
    final ob = other.bottom;
    result.left = (left > other.left) ? left : other.left;
    result.top = (top > other.top ) ? top : other.top;    
    result.right = (r < or) ? r : or;
    result.bottom = (b < ob) ? b : ob;
    return true;
  }
  
  /**
   * Rounds in place the [left], [top], [right] and [bottom] of this [Rectangle]
   * to the nearest integer values.
   */
  void round() => roundTo(this);
  
  /**
   * Rounds the [left], [top], [right] and [bottom] of this [Rectangle]
   * to the nearest integer values and writes the rounded values to [result].
   */
  void roundTo(Rectangle result) {
    // we calculate right and bottom first and store the values
    final r = right.round();
    final b = bottom.round();
    // then we can set the rounded left and top on the result
    result.left = left.round();
    result.top = top.round();
    // finally we can set the right / bottom and width / height will be correct
    result.right = r;
    result.bottom = b;
  }
  
  String toString() => "rectangle($left,$top,$width,$height)";
  
  /**
   * Translates this [Rectangle] the given [offsetX] along the positive x-axis
   * and the given [offsetY] along the positive y-axis.
   */
  void translate(num offsetX, num offsetY) {
    left += offsetX;
    top += offsetY;
  }
  
  /// Performs an in place union between this [Rectangle] and the [other].
  void unite(Rectangle other) => uniteTo(other, this);
  
  /**
   * Performs a union between this [Rectangle] and the [other] and writes
   * it out to the [result].
   */
  void uniteTo(Rectangle other, Rectangle result) {
    // store the (calculated) right/bottom values before we change left/top
    final r = right;
    final b = bottom;
    final or = other.right;
    final ob = other.bottom;
    result.left = (left < other.left) ? left : other.left;
    result.top = (top < other.top ) ? top : other.top;
    result.right = (r > or) ? r : or;
    result.bottom = (b > ob) ? b : ob;
  }
}
