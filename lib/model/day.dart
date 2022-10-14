// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'condition.dart';

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? avgvisKm;
  double? avgvisMiles;
  double? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;
  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  Day copyWith({
    double? maxtempC,
    double? maxtempF,
    double? mintempC,
    double? mintempF,
    double? avgtempC,
    double? avgtempF,
    double? maxwindMph,
    double? maxwindKph,
    double? totalprecipMm,
    double? totalprecipIn,
    double? avgvisKm,
    double? avgvisMiles,
    double? avghumidity,
    int? dailyWillItRain,
    int? dailyChanceOfRain,
    int? dailyWillItSnow,
    int? dailyChanceOfSnow,
    Condition? condition,
    double? uv,
  }) {
    return Day(
      maxtempC: maxtempC ?? this.maxtempC,
      maxtempF: maxtempF ?? this.maxtempF,
      mintempC: mintempC ?? this.mintempC,
      mintempF: mintempF ?? this.mintempF,
      avgtempC: avgtempC ?? this.avgtempC,
      avgtempF: avgtempF ?? this.avgtempF,
      maxwindMph: maxwindMph ?? this.maxwindMph,
      maxwindKph: maxwindKph ?? this.maxwindKph,
      totalprecipMm: totalprecipMm ?? this.totalprecipMm,
      totalprecipIn: totalprecipIn ?? this.totalprecipIn,
      avgvisKm: avgvisKm ?? this.avgvisKm,
      avgvisMiles: avgvisMiles ?? this.avgvisMiles,
      avghumidity: avghumidity ?? this.avghumidity,
      dailyWillItRain: dailyWillItRain ?? this.dailyWillItRain,
      dailyChanceOfRain: dailyChanceOfRain ?? this.dailyChanceOfRain,
      dailyWillItSnow: dailyWillItSnow ?? this.dailyWillItSnow,
      dailyChanceOfSnow: dailyChanceOfSnow ?? this.dailyChanceOfSnow,
      condition: condition ?? this.condition,
      uv: uv ?? this.uv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maxtempC': maxtempC,
      'maxtempF': maxtempF,
      'mintempC': mintempC,
      'mintempF': mintempF,
      'avgtempC': avgtempC,
      'avgtempF': avgtempF,
      'maxwindMph': maxwindMph,
      'maxwindKph': maxwindKph,
      'totalprecipMm': totalprecipMm,
      'totalprecipIn': totalprecipIn,
      'avgvisKm': avgvisKm,
      'avgvisMiles': avgvisMiles,
      'avghumidity': avghumidity,
      'dailyWillItRain': dailyWillItRain,
      'dailyChanceOfRain': dailyChanceOfRain,
      'dailyWillItSnow': dailyWillItSnow,
      'dailyChanceOfSnow': dailyChanceOfSnow,
      'condition': condition?.toMap(),
      'uv': uv,
    };
  }

  factory Day.fromMap(Map<String, dynamic> map) {
    return Day(
      maxtempC: map['maxtempC'] != null ? map['maxtempC'] as double : null,
      maxtempF: map['maxtempF'] != null ? map['maxtempF'] as double : null,
      mintempC: map['mintempC'] != null ? map['mintempC'] as double : null,
      mintempF: map['mintempF'] != null ? map['mintempF'] as double : null,
      avgtempC: map['avgtempC'] != null ? map['avgtempC'] as double : null,
      avgtempF: map['avgtempF'] != null ? map['avgtempF'] as double : null,
      maxwindMph:
          map['maxwindMph'] != null ? map['maxwindMph'] as double : null,
      maxwindKph:
          map['maxwindKph'] != null ? map['maxwindKph'] as double : null,
      totalprecipMm:
          map['totalprecipMm'] != null ? map['totalprecipMm'] as double : null,
      totalprecipIn:
          map['totalprecipIn'] != null ? map['totalprecipIn'] as double : null,
      avgvisKm: map['avgvisKm'] != null ? map['avgvisKm'] as double : null,
      avgvisMiles:
          map['avgvisMiles'] != null ? map['avgvisMiles'] as double : null,
      avghumidity:
          map['avghumidity'] != null ? map['avghumidity'] as double : null,
      dailyWillItRain:
          map['dailyWillItRain'] != null ? map['dailyWillItRain'] as int : null,
      dailyChanceOfRain: map['dailyChanceOfRain'] != null
          ? map['dailyChanceOfRain'] as int
          : null,
      dailyWillItSnow:
          map['dailyWillItSnow'] != null ? map['dailyWillItSnow'] as int : null,
      dailyChanceOfSnow: map['dailyChanceOfSnow'] != null
          ? map['dailyChanceOfSnow'] as int
          : null,
      condition: map['condition'] != null
          ? Condition.fromMap(map['condition'] as Map<String, dynamic>)
          : null,
      uv: map['uv'] != null ? map['uv'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Day.fromJson(String source) =>
      Day.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Day(maxtempC: $maxtempC, maxtempF: $maxtempF, mintempC: $mintempC, mintempF: $mintempF, avgtempC: $avgtempC, avgtempF: $avgtempF, maxwindMph: $maxwindMph, maxwindKph: $maxwindKph, totalprecipMm: $totalprecipMm, totalprecipIn: $totalprecipIn, avgvisKm: $avgvisKm, avgvisMiles: $avgvisMiles, avghumidity: $avghumidity, dailyWillItRain: $dailyWillItRain, dailyChanceOfRain: $dailyChanceOfRain, dailyWillItSnow: $dailyWillItSnow, dailyChanceOfSnow: $dailyChanceOfSnow, condition: $condition, uv: $uv)';
  }

  @override
  bool operator ==(covariant Day other) {
    if (identical(this, other)) return true;

    return other.maxtempC == maxtempC &&
        other.maxtempF == maxtempF &&
        other.mintempC == mintempC &&
        other.mintempF == mintempF &&
        other.avgtempC == avgtempC &&
        other.avgtempF == avgtempF &&
        other.maxwindMph == maxwindMph &&
        other.maxwindKph == maxwindKph &&
        other.totalprecipMm == totalprecipMm &&
        other.totalprecipIn == totalprecipIn &&
        other.avgvisKm == avgvisKm &&
        other.avgvisMiles == avgvisMiles &&
        other.avghumidity == avghumidity &&
        other.dailyWillItRain == dailyWillItRain &&
        other.dailyChanceOfRain == dailyChanceOfRain &&
        other.dailyWillItSnow == dailyWillItSnow &&
        other.dailyChanceOfSnow == dailyChanceOfSnow &&
        other.condition == condition &&
        other.uv == uv;
  }

  @override
  int get hashCode {
    return maxtempC.hashCode ^
        maxtempF.hashCode ^
        mintempC.hashCode ^
        mintempF.hashCode ^
        avgtempC.hashCode ^
        avgtempF.hashCode ^
        maxwindMph.hashCode ^
        maxwindKph.hashCode ^
        totalprecipMm.hashCode ^
        totalprecipIn.hashCode ^
        avgvisKm.hashCode ^
        avgvisMiles.hashCode ^
        avghumidity.hashCode ^
        dailyWillItRain.hashCode ^
        dailyChanceOfRain.hashCode ^
        dailyWillItSnow.hashCode ^
        dailyChanceOfSnow.hashCode ^
        condition.hashCode ^
        uv.hashCode;
  }
}
