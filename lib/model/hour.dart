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

  factory Hour.fromMap(Map<String, dynamic> map) {
    return Hour(
      timeEpoch: map['timeEpoch'] != null ? map['timeEpoch'] as int : null,
      time: map['time'] != null ? map['time'] as String : null,
      tempC: map['tempC'] != null ? map['tempC'] as double : null,
      tempF: map['tempF'] != null ? map['tempF'] as double : null,
      isDay: map['isDay'] != null ? map['isDay'] as int : null,
      condition: map['condition'] != null
          ? Condition.fromMap(map['condition'] as Map<String, dynamic>)
          : null,
      windMph: map['windMph'] != null ? map['windMph'] as double : null,
      windKph: map['windKph'] != null ? map['windKph'] as double : null,
      windDegree: map['windDegree'] != null ? map['windDegree'] as int : null,
      windDir: map['windDir'] != null ? map['windDir'] as String : null,
      pressureMb:
          map['pressureMb'] != null ? map['pressureMb'] as double : null,
      pressureIn:
          map['pressureIn'] != null ? map['pressureIn'] as double : null,
      precipMm: map['precipMm'] != null ? map['precipMm'] as double : null,
      precipIn: map['precipIn'] != null ? map['precipIn'] as double : null,
      humidity: map['humidity'] != null ? map['humidity'] as int : null,
      cloud: map['cloud'] != null ? map['cloud'] as int : null,
      feelslikeC:
          map['feelslikeC'] != null ? map['feelslikeC'] as double : null,
      feelslikeF:
          map['feelslikeF'] != null ? map['feelslikeF'] as double : null,
      windchillC:
          map['windchillC'] != null ? map['windchillC'] as double : null,
      windchillF:
          map['windchillF'] != null ? map['windchillF'] as double : null,
      heatindexC:
          map['heatindexC'] != null ? map['heatindexC'] as double : null,
      heatindexF:
          map['heatindexF'] != null ? map['heatindexF'] as double : null,
      dewpointC: map['dewpointC'] != null ? map['dewpointC'] as double : null,
      dewpointF: map['dewpointF'] != null ? map['dewpointF'] as double : null,
      willItRain: map['willItRain'] != null ? map['willItRain'] as int : null,
      chanceOfRain:
          map['chanceOfRain'] != null ? map['chanceOfRain'] as int : null,
      willItSnow: map['willItSnow'] != null ? map['willItSnow'] as int : null,
      chanceOfSnow:
          map['chanceOfSnow'] != null ? map['chanceOfSnow'] as int : null,
      visKm: map['visKm'] != null ? map['visKm'] as double : null,
      visMiles: map['visMiles'] != null ? map['visMiles'] as double : null,
      gustMph: map['gustMph'] != null ? map['gustMph'] as double : null,
      gustKph: map['gustKph'] != null ? map['gustKph'] as double : null,
      uv: map['uv'] != null ? map['uv'] as double : null,
    );
  }

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
