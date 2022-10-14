// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'Location.dart';
import 'current.dart';
import 'forecast.dart';

class WeekendWeather {
  Location? location;
  Current? current;
  Forecast? forecast;
  WeekendWeather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  // factory WeekendWeather.fromJson(Map<String, dynamic> json) {
  //   var l =
  //       json['location'] != null ? Location.fromJson(json['location']) : null;
  //   var c = json['current'] != null ? Current.fromJson(json['current']) : null;
  //   var f =
  //       json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  //   return WeekendWeather(location: l!, current: c!, forecast: f!);
  // }

  WeekendWeather copyWith({
    Location? location,
    Current? current,
    Forecast? forecast,
  }) {
    return WeekendWeather(
      location: location ?? this.location,
      current: current ?? this.current,
      forecast: forecast ?? this.forecast,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location?.toMap(),
      'current': current?.toMap(),
      'forecast': forecast?.toMap(),
    };
  }

  factory WeekendWeather.fromMap(Map<String, dynamic> data) => WeekendWeather(
        location: data['location'] == null
            ? null
            : Location.fromMap(data['location'] as Map<String, dynamic>),
        current: data['current'] == null
            ? null
            : Current.fromMap(data['current'] as Map<String, dynamic>),
        forecast: data['forecast'] == null
            ? null
            : Forecast.fromMap(data['forecast'] as Map<String, dynamic>),
      );

  String toJson() => json.encode(toMap());

  factory WeekendWeather.fromJson(String source) =>
      WeekendWeather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WeekendWeather(location: $location, current: $current, forecast: $forecast)';

  @override
  bool operator ==(covariant WeekendWeather other) {
    if (identical(this, other)) return true;

    return other.location == location &&
        other.current == current &&
        other.forecast == forecast;
  }

  @override
  int get hashCode => location.hashCode ^ current.hashCode ^ forecast.hashCode;
}
