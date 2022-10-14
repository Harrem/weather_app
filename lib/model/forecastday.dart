import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'astro.dart';
import 'day.dart';
import 'hour.dart';

class Forecastday {
  String date;
  int dateEpoch;
  Day day;
  Astro astro;
  List<Hour> hour;
  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  Forecastday copyWith({
    String? date,
    int? dateEpoch,
    Day? day,
    Astro? astro,
    List<Hour>? hour,
  }) {
    return Forecastday(
      date: date ?? this.date,
      dateEpoch: dateEpoch ?? this.dateEpoch,
      day: day ?? this.day,
      astro: astro ?? this.astro,
      hour: hour ?? this.hour,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'dateEpoch': dateEpoch,
      'day': day.toMap(),
      'astro': astro.toMap(),
      'hour': hour.map((x) => x.toMap()).toList(),
    };
  }

  factory Forecastday.fromMap(Map<String, dynamic> map) {
    return Forecastday(
      date: map['date'] as String,
      dateEpoch: map['dateEpoch'] as int,
      day: Day.fromMap(map['day'] as Map<String, dynamic>),
      astro: Astro.fromMap(map['astro'] as Map<String, dynamic>),
      hour: List<Hour>.from(
        (map['hour'] as List<int>).map<Hour>(
          (x) => Hour.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Forecastday.fromJson(String source) =>
      Forecastday.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Forecastday(date: $date, dateEpoch: $dateEpoch, day: $day, astro: $astro, hour: $hour)';
  }

  @override
  bool operator ==(covariant Forecastday other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.dateEpoch == dateEpoch &&
        other.day == day &&
        other.astro == astro &&
        listEquals(other.hour, hour);
  }

  @override
  int get hashCode {
    return date.hashCode ^
        dateEpoch.hashCode ^
        day.hashCode ^
        astro.hashCode ^
        hour.hashCode;
  }
}
