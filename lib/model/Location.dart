// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'dart:convert';

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    this.tzId,
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
      name: map['name'] != null ? map['name'] as String : null,
      region: map['region'] != null ? map['region'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
      lon: map['lon'] != null ? map['lon'] as double : null,
      tzId: map['tzId'] != null ? map['tzId'] as String : null,
      localtimeEpoch:
          map['localtimeEpoch'] != null ? map['localtimeEpoch'] as int : null,
      localtime: map['localtime'] != null ? map['localtime'] as String : null,
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
