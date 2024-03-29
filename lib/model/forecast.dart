// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'forecastday.dart';

class Forecast {
  List<Forecastday>? forecastday;
  Forecast({
    required this.forecastday,
  });

  Forecast copyWith({
    List<Forecastday>? forecastday,
  }) {
    return Forecast(
      forecastday: forecastday ?? this.forecastday,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'forecastday': forecastday?.map((x) => x.toMap()).toList(),
    };
  }

  factory Forecast.fromMap(Map<String, dynamic> map) {
    return Forecast(
      forecastday: map['forecastday'] != null
          ? List<Forecastday>.from(
              (map['forecastday'] as List<dynamic>).map<Forecastday?>(
                (x) => Forecastday.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Forecast.fromJson(String source) =>
      Forecast.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Forecast(forecastday: $forecastday)';

  @override
  bool operator ==(covariant Forecast other) {
    if (identical(this, other)) return true;

    return listEquals(other.forecastday, forecastday);
  }

  @override
  int get hashCode => forecastday.hashCode;
}
