class HourlyWeatherRes {
  HourlyWeatherRes({
      this.code, 
      this.updateTime, 
      this.fxLink, 
      this.hourly, 
      this.refer,});

  HourlyWeatherRes.fromJson(dynamic json) {
    code = json['code'];
    updateTime = json['updateTime'];
    fxLink = json['fxLink'];
    if (json['hourly'] != null) {
      hourly = [];
      json['hourly'].forEach((v) {
        hourly?.add(Hourly.fromJson(v));
      });
    }
    refer = json['refer'] != null ? Refer.fromJson(json['refer']) : null;
  }
  String? code;
  String? updateTime;
  String? fxLink;
  List<Hourly>? hourly;
  Refer? refer;
HourlyWeatherRes copyWith({  String? code,
  String? updateTime,
  String? fxLink,
  List<Hourly>? hourly,
  Refer? refer,
}) => HourlyWeatherRes(  code: code ?? this.code,
  updateTime: updateTime ?? this.updateTime,
  fxLink: fxLink ?? this.fxLink,
  hourly: hourly ?? this.hourly,
  refer: refer ?? this.refer,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['updateTime'] = updateTime;
    map['fxLink'] = fxLink;
    if (hourly != null) {
      map['hourly'] = hourly?.map((v) => v.toJson()).toList();
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

class Hourly {
  Hourly({
      this.fxTime, 
      this.temp, 
      this.icon, 
      this.text, 
      this.wind360, 
      this.windDir, 
      this.windScale, 
      this.windSpeed, 
      this.humidity, 
      this.pop, 
      this.precip, 
      this.pressure, 
      this.cloud, 
      this.dew,});

  Hourly.fromJson(dynamic json) {
    fxTime = json['fxTime'];
    temp = json['temp'];
    icon = json['icon'];
    text = json['text'];
    wind360 = json['wind360'];
    windDir = json['windDir'];
    windScale = json['windScale'];
    windSpeed = json['windSpeed'];
    humidity = json['humidity'];
    pop = json['pop'];
    precip = json['precip'];
    pressure = json['pressure'];
    cloud = json['cloud'];
    dew = json['dew'];
  }
  String? fxTime;
  String? temp;
  String? icon;
  String? text;
  String? wind360;
  String? windDir;
  String? windScale;
  String? windSpeed;
  String? humidity;
  String? pop;
  String? precip;
  String? pressure;
  String? cloud;
  String? dew;
Hourly copyWith({  String? fxTime,
  String? temp,
  String? icon,
  String? text,
  String? wind360,
  String? windDir,
  String? windScale,
  String? windSpeed,
  String? humidity,
  String? pop,
  String? precip,
  String? pressure,
  String? cloud,
  String? dew,
}) => Hourly(  fxTime: fxTime ?? this.fxTime,
  temp: temp ?? this.temp,
  icon: icon ?? this.icon,
  text: text ?? this.text,
  wind360: wind360 ?? this.wind360,
  windDir: windDir ?? this.windDir,
  windScale: windScale ?? this.windScale,
  windSpeed: windSpeed ?? this.windSpeed,
  humidity: humidity ?? this.humidity,
  pop: pop ?? this.pop,
  precip: precip ?? this.precip,
  pressure: pressure ?? this.pressure,
  cloud: cloud ?? this.cloud,
  dew: dew ?? this.dew,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fxTime'] = fxTime;
    map['temp'] = temp;
    map['icon'] = icon;
    map['text'] = text;
    map['wind360'] = wind360;
    map['windDir'] = windDir;
    map['windScale'] = windScale;
    map['windSpeed'] = windSpeed;
    map['humidity'] = humidity;
    map['pop'] = pop;
    map['precip'] = precip;
    map['pressure'] = pressure;
    map['cloud'] = cloud;
    map['dew'] = dew;
    return map;
  }

}