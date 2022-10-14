// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'condition.dart';

class Hour {
  int? timeEpoch;
  String? time;
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
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  double? visKm;
  double? visMiles;
  double? gustMph;
  double? gustKph;
  double? uv;
  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });

  Hour copyWith({
    int? timeEpoch,
    String? time,
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
    double? windchillC,
    double? windchillF,
    double? heatindexC,
    double? heatindexF,
    double? dewpointC,
    double? dewpointF,
    int? willItRain,
    int? chanceOfRain,
    int? willItSnow,
    int? chanceOfSnow,
    double? visKm,
    double? visMiles,
    double? gustMph,
    double? gustKph,
    double? uv,
  }) {
    return Hour(
      timeEpoch: timeEpoch ?? this.timeEpoch,
      time: time ?? this.time,
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
      windchillC: windchillC ?? this.windchillC,
      windchillF: windchillF ?? this.windchillF,
      heatindexC: heatindexC ?? this.heatindexC,
      heatindexF: heatindexF ?? this.heatindexF,
      dewpointC: dewpointC ?? this.dewpointC,
      dewpointF: dewpointF ?? this.dewpointF,
      willItRain: willItRain ?? this.willItRain,
      chanceOfRain: chanceOfRain ?? this.chanceOfRain,
      willItSnow: willItSnow ?? this.willItSnow,
      chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
      visKm: visKm ?? this.visKm,
      visMiles: visMiles ?? this.visMiles,
      gustMph: gustMph ?? this.gustMph,
      gustKph: gustKph ?? this.gustKph,
      uv: uv ?? this.uv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timeEpoch': timeEpoch,
      'time': time,
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
      'windchillC': windchillC,
      'windchillF': windchillF,
      'heatindexC': heatindexC,
      'heatindexF': heatindexF,
      'dewpointC': dewpointC,
      'dewpointF': dewpointF,
      'willItRain': willItRain,
      'chanceOfRain': chanceOfRain,
      'willItSnow': willItSnow,
      'chanceOfSnow': chanceOfSnow,
      'visKm': visKm,
      'visMiles': visMiles,
      'gustMph': gustMph,
      'gustKph': gustKph,
      'uv': uv,
    };
  }

  factory Hour.fromMap(Map<String, dynamic> data) => Hour(
        timeEpoch: data['time_epoch'] as int?,
        time: data['time'] as String?,
        tempC: (data['temp_c'] as num?)?.toDouble(),
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
        windchillC: (data['windchill_c'] as num?)?.toDouble(),
        windchillF: (data['windchill_f'] as num?)?.toDouble(),
        heatindexC: (data['heatindex_c'] as num?)?.toDouble(),
        heatindexF: (data['heatindex_f'] as num?)?.toDouble(),
        dewpointC: data['dewpoint_c'] as double?,
        dewpointF: data['dewpoint_f'] as double?,
        willItRain: data['will_it_rain'] as int?,
        chanceOfRain: data['chance_of_rain'] as int?,
        willItSnow: data['will_it_snow'] as int?,
        chanceOfSnow: data['chance_of_snow'] as int?,
        visKm: data['vis_km'] as double?,
        visMiles: data['vis_miles'] as double?,
        gustMph: data['gust_mph'] as double?,
        gustKph: (data['gust_kph'] as num?)?.toDouble(),
        uv: data['uv'] as double?,
      );

  String toJson() => json.encode(toMap());

  factory Hour.fromJson(String source) =>
      Hour.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Hour(timeEpoch: $timeEpoch, time: $time, tempC: $tempC, tempF: $tempF, isDay: $isDay, condition: $condition, windMph: $windMph, windKph: $windKph, windDegree: $windDegree, windDir: $windDir, pressureMb: $pressureMb, pressureIn: $pressureIn, precipMm: $precipMm, precipIn: $precipIn, humidity: $humidity, cloud: $cloud, feelslikeC: $feelslikeC, feelslikeF: $feelslikeF, windchillC: $windchillC, windchillF: $windchillF, heatindexC: $heatindexC, heatindexF: $heatindexF, dewpointC: $dewpointC, dewpointF: $dewpointF, willItRain: $willItRain, chanceOfRain: $chanceOfRain, willItSnow: $willItSnow, chanceOfSnow: $chanceOfSnow, visKm: $visKm, visMiles: $visMiles, gustMph: $gustMph, gustKph: $gustKph, uv: $uv)';
  }

  @override
  bool operator ==(covariant Hour other) {
    if (identical(this, other)) return true;

    return other.timeEpoch == timeEpoch &&
        other.time == time &&
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
        other.windchillC == windchillC &&
        other.windchillF == windchillF &&
        other.heatindexC == heatindexC &&
        other.heatindexF == heatindexF &&
        other.dewpointC == dewpointC &&
        other.dewpointF == dewpointF &&
        other.willItRain == willItRain &&
        other.chanceOfRain == chanceOfRain &&
        other.willItSnow == willItSnow &&
        other.chanceOfSnow == chanceOfSnow &&
        other.visKm == visKm &&
        other.visMiles == visMiles &&
        other.gustMph == gustMph &&
        other.gustKph == gustKph &&
        other.uv == uv;
  }

  @override
  int get hashCode {
    return timeEpoch.hashCode ^
        time.hashCode ^
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
        windchillC.hashCode ^
        windchillF.hashCode ^
        heatindexC.hashCode ^
        heatindexF.hashCode ^
        dewpointC.hashCode ^
        dewpointF.hashCode ^
        willItRain.hashCode ^
        chanceOfRain.hashCode ^
        willItSnow.hashCode ^
        chanceOfSnow.hashCode ^
        visKm.hashCode ^
        visMiles.hashCode ^
        gustMph.hashCode ^
        gustKph.hashCode ^
        uv.hashCode;
  }
}
