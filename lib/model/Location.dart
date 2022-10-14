import 'dart:convert';

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  int localtimeEpoch;
  String localtime;
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  Location copyWith({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    int? localtimeEpoch,
    String? localtime,
  }) {
    return Location(
      name: name ?? this.name,
      region: region ?? this.region,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      tzId: tzId ?? this.tzId,
      localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
      localtime: localtime ?? this.localtime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'region': region,
      'country': country,
      'lat': lat,
      'lon': lon,
      'tzId': tzId,
      'localtimeEpoch': localtimeEpoch,
      'localtime': localtime,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] as String,
      region: map['region'] as String,
      country: map['country'] as String,
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      tzId: map['tzId'] as String,
      localtimeEpoch: map['localtimeEpoch'] as int,
      localtime: map['localtime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Location(name: $name, region: $region, country: $country, lat: $lat, lon: $lon, tzId: $tzId, localtimeEpoch: $localtimeEpoch, localtime: $localtime)';
  }

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.region == region &&
        other.country == country &&
        other.lat == lat &&
        other.lon == lon &&
        other.tzId == tzId &&
        other.localtimeEpoch == localtimeEpoch &&
        other.localtime == localtime;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        region.hashCode ^
        country.hashCode ^
        lat.hashCode ^
        lon.hashCode ^
        tzId.hashCode ^
        localtimeEpoch.hashCode ^
        localtime.hashCode;
  }
}
