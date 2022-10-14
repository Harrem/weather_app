import 'dart:convert';

import 'air_quality.dart';
import 'condition.dart';

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;
  AirQuality? airQuality;
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.airQuality,
  });

  Current copyWith({
    int? lastUpdatedEpoch,
    String? lastUpdated,
    double? tempC,
    double? tempF,
    int? isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    double? pressureMb,
    double? pressureIn,
    double? precipMm,
    double? precipIn,
    int? humidity,
    int? cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? visKm,
    double? visMiles,
    double? uv,
    double? gustMph,
    double? gustKph,
    AirQuality? airQuality,
  }) {
    return Current(
      lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      tempC: tempC ?? this.tempC,
      tempF: tempF ?? this.tempF,
      isDay: isDay ?? this.isDay,
      condition: condition ?? this.condition,
      windMph: windMph ?? this.windMph,
      windKph: windKph ?? this.windKph,
      windDegree: windDegree ?? this.windDegree,
      windDir: windDir ?? this.windDir,
      pressureMb: pressureMb ?? this.pressureMb,
      pressureIn: pressureIn ?? this.pressureIn,
      precipMm: precipMm ?? this.precipMm,
      precipIn: precipIn ?? this.precipIn,
      humidity: humidity ?? this.humidity,
      cloud: cloud ?? this.cloud,
      feelslikeC: feelslikeC ?? this.feelslikeC,
      feelslikeF: feelslikeF ?? this.feelslikeF,
      visKm: visKm ?? this.visKm,
      visMiles: visMiles ?? this.visMiles,
      uv: uv ?? this.uv,
      gustMph: gustMph ?? this.gustMph,
      gustKph: gustKph ?? this.gustKph,
      airQuality: airQuality ?? this.airQuality,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lastUpdatedEpoch': lastUpdatedEpoch,
      'lastUpdated': lastUpdated,
      'tempC': tempC,
      'tempF': tempF,
      'isDay': isDay,
      'condition': condition?.toMap(),
      'windMph': windMph,
      'windKph': windKph,
      'windDegree': windDegree,
      'windDir': windDir,
      'pressureMb': pressureMb,
      'pressureIn': pressureIn,
      'precipMm': precipMm,
      'precipIn': precipIn,
      'humidity': humidity,
      'cloud': cloud,
      'feelslikeC': feelslikeC,
      'feelslikeF': feelslikeF,
      'visKm': visKm,
      'visMiles': visMiles,
      'uv': uv,
      'gustMph': gustMph,
      'gustKph': gustKph,
      'airQuality': airQuality?.toMap(),
    };
  }

  factory Current.fromMap(Map<String, dynamic> data) => Current(
        lastUpdatedEpoch: data['last_updated_epoch'] as int?,
        lastUpdated: data['last_updated'] as String?,
        tempC: data['temp_c'] as double?,
        tempF: (data['temp_f'] as num?)?.toDouble(),
        isDay: data['is_day'] as int?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
        windMph: (data['wind_mph'] as num?)?.toDouble(),
        windKph: data['wind_kph'] as double?,
        windDegree: data['wind_degree'] as int?,
        windDir: data['wind_dir'] as String?,
        pressureMb: data['pressure_mb'] as double?,
        pressureIn: (data['pressure_in'] as num?)?.toDouble(),
        precipMm: data['precip_mm'] as double?,
        precipIn: data['precip_in'] as double?,
        humidity: data['humidity'] as int?,
        cloud: data['cloud'] as int?,
        feelslikeC: (data['feelslike_c'] as num?)?.toDouble(),
        feelslikeF: (data['feelslike_f'] as num?)?.toDouble(),
        visKm: data['vis_km'] as double?,
        visMiles: data['vis_miles'] as double?,
        uv: data['uv'] as double?,
        gustMph: (data['gust_mph'] as num?)?.toDouble(),
        gustKph: (data['gust_kph'] as num?)?.toDouble(),
        airQuality: data['air_quality'] == null
            ? null
            : AirQuality.fromMap(data['air_quality'] as Map<String, dynamic>),
      );

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) =>
      Current.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Current(lastUpdatedEpoch: $lastUpdatedEpoch, lastUpdated: $lastUpdated, tempC: $tempC, tempF: $tempF, isDay: $isDay, condition: $condition, windMph: $windMph, windKph: $windKph, windDegree: $windDegree, windDir: $windDir, pressureMb: $pressureMb, pressureIn: $pressureIn, precipMm: $precipMm, precipIn: $precipIn, humidity: $humidity, cloud: $cloud, feelslikeC: $feelslikeC, feelslikeF: $feelslikeF, visKm: $visKm, visMiles: $visMiles, uv: $uv, gustMph: $gustMph, gustKph: $gustKph, airQuality: $airQuality)';
  }

  @override
  bool operator ==(covariant Current other) {
    if (identical(this, other)) return true;

    return other.lastUpdatedEpoch == lastUpdatedEpoch &&
        other.lastUpdated == lastUpdated &&
        other.tempC == tempC &&
        other.tempF == tempF &&
        other.isDay == isDay &&
        other.condition == condition &&
        other.windMph == windMph &&
        other.windKph == windKph &&
        other.windDegree == windDegree &&
        other.windDir == windDir &&
        other.pressureMb == pressureMb &&
        other.pressureIn == pressureIn &&
        other.precipMm == precipMm &&
        other.precipIn == precipIn &&
        other.humidity == humidity &&
        other.cloud == cloud &&
        other.feelslikeC == feelslikeC &&
        other.feelslikeF == feelslikeF &&
        other.visKm == visKm &&
        other.visMiles == visMiles &&
        other.uv == uv &&
        other.gustMph == gustMph &&
        other.gustKph == gustKph &&
        other.airQuality == airQuality;
  }

  @override
  int get hashCode {
    return lastUpdatedEpoch.hashCode ^
        lastUpdated.hashCode ^
        tempC.hashCode ^
        tempF.hashCode ^
        isDay.hashCode ^
        condition.hashCode ^
        windMph.hashCode ^
        windKph.hashCode ^
        windDegree.hashCode ^
        windDir.hashCode ^
        pressureMb.hashCode ^
        pressureIn.hashCode ^
        precipMm.hashCode ^
        precipIn.hashCode ^
        humidity.hashCode ^
        cloud.hashCode ^
        feelslikeC.hashCode ^
        feelslikeF.hashCode ^
        visKm.hashCode ^
        visMiles.hashCode ^
        uv.hashCode ^
        gustMph.hashCode ^
        gustKph.hashCode ^
        airQuality.hashCode;
  }
}
