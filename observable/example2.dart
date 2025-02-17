import 'dart:async';

class WeatherStation {
  final _controller = StreamController<double>();

  Stream<double> get temperatureStream => _controller.stream;

  void updateTemperature(double temperature) {
    _controller.add(temperature);
  }
}

void main() {
  var weatherStation = WeatherStation();

  weatherStation.temperatureStream.listen((temperature) {
    print("Temperature updated: $temperature°C");
  });

  weatherStation.updateTemperature(25.0);
  weatherStation.updateTemperature(30.0);
}
