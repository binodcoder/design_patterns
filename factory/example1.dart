abstract class IShape {
  void draw();
}

class Circle implements IShape {
  @override
  void draw() {
    print("circle");
  }
}

class Rectangle implements IShape {
  @override
  void draw() {
    print("rectangle");
  }
}

class ShapeFactory {
  static IShape createShape(String type) {
    if (type == "circle") return Circle();
    if (type == "rectangle") return Rectangle();
    throw Exception('Unknown animal');
  }
}

void main() {
  var circle = ShapeFactory.createShape("circle");
  circle.draw();
}
