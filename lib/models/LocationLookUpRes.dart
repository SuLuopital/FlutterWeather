class LocationLookUpRes {
  LocationLookUpRes({
      this.code, 
      this.location, 
      this.refer,});

  LocationLookUpRes.fromJson(dynamic json) {
    code = json['code'];
    if (json['location'] != null) {
      location = [];
      json['location'].forEach((v) {
        location?.add(Location.fromJson(v));
      });
    }
    refer = json['refer'] != null ? Refer.fromJson(json['refer']) : null;
  }
  String? code;
  List<Location>? location;
  Refer? refer;
LocationLookUpRes copyWith({  String? code,
  List<Location>? location,
  Refer? refer,
}) => LocationLookUpRes(  code: code ?? this.code,
  location: location ?? this.location,
  refer: refer ?? this.refer,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (location != null) {
      map['location'] = location?.map((v) => v.toJson()).toList();
    }
    if (refer != null) {
      map['refer'] = refer?.toJson();
    }
    return map;
  }

}

class Refer {
  Refer({
      this.sources, 
      this.license,});

  Refer.fromJson(dynamic json) {
    sources = json['sources'] != null ? json['sources'].cast<String>() : [];
    license = json['license'] != null ? json['license'].cast<String>() : [];
  }
  List<String>? sources;
  List<String>? license;
Refer copyWith({  List<String>? sources,
  List<String>? license,
}) => Refer(  sources: sources ?? this.sources,
  license: license ?? this.license,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sources'] = sources;
    map['license'] = license;
    return map;
  }

}

class Location {
  Location({
      this.name, 
      this.id, 
      this.lat, 
      this.lon, 
      this.adm2, 
      this.adm1, 
      this.country, 
      this.tz, 
      this.utcOffset, 
      this.isDst, 
      this.type, 
      this.rank, 
      this.fxLink,});

  Location.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    lat = json['lat'];
    lon = json['lon'];
    adm2 = json['adm2'];
    adm1 = json['adm1'];
    country = json['country'];
    tz = json['tz'];
    utcOffset = json['utcOffset'];
    isDst = json['isDst'];
    type = json['type'];
    rank = json['rank'];
    fxLink = json['fxLink'];
  }
  String? name;
  String? id;
  String? lat;
  String? lon;
  String? adm2;
  String? adm1;
  String? country;
  String? tz;
  String? utcOffset;
  String? isDst;
  String? type;
  String? rank;
  String? fxLink;
Location copyWith({  String? name,
  String? id,
  String? lat,
  String? lon,
  String? adm2,
  String? adm1,
  String? country,
  String? tz,
  String? utcOffset,
  String? isDst,
  String? type,
  String? rank,
  String? fxLink,
}) => Location(  name: name ?? this.name,
  id: id ?? this.id,
  lat: lat ?? this.lat,
  lon: lon ?? this.lon,
  adm2: adm2 ?? this.adm2,
  adm1: adm1 ?? this.adm1,
  country: country ?? this.country,
  tz: tz ?? this.tz,
  utcOffset: utcOffset ?? this.utcOffset,
  isDst: isDst ?? this.isDst,
  type: type ?? this.type,
  rank: rank ?? this.rank,
  fxLink: fxLink ?? this.fxLink,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['lat'] = lat;
    map['lon'] = lon;
    map['adm2'] = adm2;
    map['adm1'] = adm1;
    map['country'] = country;
    map['tz'] = tz;
    map['utcOffset'] = utcOffset;
    map['isDst'] = isDst;
    map['type'] = type;
    map['rank'] = rank;
    map['fxLink'] = fxLink;
    return map;
  }

}