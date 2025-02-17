class Car {
  Car({
    this.engine,
    this.wheel,
  });

  String? engine;
  int? wheel;

  @override
  String toString() => "Car with $engine engine and $wheel wheels";
}

class CarBuilder {
  String? _engine;
  int? _wheel;

  CarBuilder setEngine(String engine) {
    _engine = engine;
    return this;
  }

  CarBuilder setWheel(int wheel) {
    _wheel = wheel;
    return this;
  }

  Car build() {
    return Car(
      engine: this._engine,
      wheel: this._wheel,
    );
  }
}

void main() {
  Car car = CarBuilder().setEngine("v8").setWheel(4).build();
  print(car);
}
