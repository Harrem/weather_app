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

  factory Day.fromMap(Map<String, dynamic> data) => Day(
        maxtempC: (data['maxtemp_c'] as num?)?.toDouble(),
        maxtempF: (data['maxtemp_f'] as num?)?.toDouble(),
        mintempC: (data['mintemp_c'] as num?)?.toDouble(),
        mintempF: (data['mintemp_f'] as num?)?.toDouble(),
        avgtempC: (data['avgtemp_c'] as num?)?.toDouble(),
        avgtempF: (data['avgtemp_f'] as num?)?.toDouble(),
        maxwindMph: (data['maxwind_mph'] as num?)?.toDouble(),
        maxwindKph: (data['maxwind_kph'] as num?)?.toDouble(),
        totalprecipMm: data['totalprecip_mm'] as double?,
        totalprecipIn: (data['totalprecip_in'] as num?)?.toDouble(),
        avgvisKm: (data['avgvis_km'] as num?)?.toDouble(),
        avgvisMiles: data['avgvis_miles'] as double?,
        avghumidity: data['avghumidity'] as double?,
        dailyWillItRain: data['daily_will_it_rain'] as int?,
        dailyChanceOfRain: data['daily_chance_of_rain'] as int?,
        dailyWillItSnow: data['daily_will_it_snow'] as int?,
        dailyChanceOfSnow: data['daily_chance_of_snow'] as int?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
        uv: data['uv'] as double?,
      );

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
