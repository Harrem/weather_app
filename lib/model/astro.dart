// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;
  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
  });

  Astro copyWith({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? moonPhase,
    String? moonIllumination,
  }) {
    return Astro(
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      moonPhase: moonPhase ?? this.moonPhase,
      moonIllumination: moonIllumination ?? this.moonIllumination,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moonPhase': moonPhase,
      'moonIllumination': moonIllumination,
    };
  }

  factory Astro.fromMap(Map<String, dynamic> map) {
    return Astro(
      sunrise: map['sunrise'] != null ? map['sunrise'] as String : null,
      sunset: map['sunset'] != null ? map['sunset'] as String : null,
      moonrise: map['moonrise'] != null ? map['moonrise'] as String : null,
      moonset: map['moonset'] != null ? map['moonset'] as String : null,
      moonPhase: map['moonPhase'] != null ? map['moonPhase'] as String : null,
      moonIllumination: map['moonIllumination'] != null
          ? map['moonIllumination'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Astro.fromJson(String source) =>
      Astro.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Astro(sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, moonPhase: $moonPhase, moonIllumination: $moonIllumination)';
  }

  @override
  bool operator ==(covariant Astro other) {
    if (identical(this, other)) return true;

    return other.sunrise == sunrise &&
        other.sunset == sunset &&
        other.moonrise == moonrise &&
        other.moonset == moonset &&
        other.moonPhase == moonPhase &&
        other.moonIllumination == moonIllumination;
  }

  @override
  int get hashCode {
    return sunrise.hashCode ^
        sunset.hashCode ^
        moonrise.hashCode ^
        moonset.hashCode ^
        moonPhase.hashCode ^
        moonIllumination.hashCode;
  }
}
