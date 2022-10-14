import 'dart:convert';

class AirQuality {
  double co;
  double no2;
  double o3;
  double so2;
  double pm25;
  double pm10;
  int usEpaIndex;
  int gbDefraIndex;
  AirQuality({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm25,
    required this.pm10,
    required this.usEpaIndex,
    required this.gbDefraIndex,
  });

  AirQuality copyWith({
    double? co,
    double? no2,
    double? o3,
    double? so2,
    double? pm25,
    double? pm10,
    int? usEpaIndex,
    int? gbDefraIndex,
  }) {
    return AirQuality(
      co: co ?? this.co,
      no2: no2 ?? this.no2,
      o3: o3 ?? this.o3,
      so2: so2 ?? this.so2,
      pm25: pm25 ?? this.pm25,
      pm10: pm10 ?? this.pm10,
      usEpaIndex: usEpaIndex ?? this.usEpaIndex,
      gbDefraIndex: gbDefraIndex ?? this.gbDefraIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'co': co,
      'no2': no2,
      'o3': o3,
      'so2': so2,
      'pm25': pm25,
      'pm10': pm10,
      'usEpaIndex': usEpaIndex,
      'gbDefraIndex': gbDefraIndex,
    };
  }

  factory AirQuality.fromMap(Map<String, dynamic> map) {
    return AirQuality(
      co: map['co'] as double,
      no2: map['no2'] as double,
      o3: map['o3'] as double,
      so2: map['so2'] as double,
      pm25: map['pm25'] as double,
      pm10: map['pm10'] as double,
      usEpaIndex: map['usEpaIndex'] as int,
      gbDefraIndex: map['gbDefraIndex'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AirQuality.fromJson(String source) =>
      AirQuality.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AirQuality(co: $co, no2: $no2, o3: $o3, so2: $so2, pm25: $pm25, pm10: $pm10, usEpaIndex: $usEpaIndex, gbDefraIndex: $gbDefraIndex)';
  }

  @override
  bool operator ==(covariant AirQuality other) {
    if (identical(this, other)) return true;

    return other.co == co &&
        other.no2 == no2 &&
        other.o3 == o3 &&
        other.so2 == so2 &&
        other.pm25 == pm25 &&
        other.pm10 == pm10 &&
        other.usEpaIndex == usEpaIndex &&
        other.gbDefraIndex == gbDefraIndex;
  }

  @override
  int get hashCode {
    return co.hashCode ^
        no2.hashCode ^
        o3.hashCode ^
        so2.hashCode ^
        pm25.hashCode ^
        pm10.hashCode ^
        usEpaIndex.hashCode ^
        gbDefraIndex.hashCode;
  }
}
