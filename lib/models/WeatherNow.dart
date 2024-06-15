class WeatherNow {
  WeatherNow({
      this.code, 
      this.updateTime, 
      this.fxLink, 
      this.now, 
      this.refer,});

  WeatherNow.fromJson(dynamic json) {
    code = json['code'];
    updateTime = json['updateTime'];
    fxLink = json['fxLink'];
    now = json['now'] != null ? Now.fromJson(json['now']) : null;
    refer = json['refer'] != null ? Refer.fromJson(json['refer']) : null;
  }
  String? code;
  String? updateTime;
  String? fxLink;
  Now? now;
  Refer? refer;
WeatherNow copyWith({  String? code,
  String? updateTime,
  String? fxLink,
  Now? now,
  Refer? refer,
}) => WeatherNow(  code: code ?? this.code,
  updateTime: updateTime ?? this.updateTime,
  fxLink: fxLink ?? this.fxLink,
  now: now ?? this.now,
  refer: refer ?? this.refer,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['updateTime'] = updateTime;
    map['fxLink'] = fxLink;
    if (now != null) {
      map['now'] = now?.toJson();
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

class Now {
  Now({
      this.obsTime, 
      this.temp, 
      this.feelsLike, 
      this.icon, 
      this.text, 
      this.wind360, 
      this.windDir, 
      this.windScale, 
      this.windSpeed, 
      this.humidity, 
      this.precip, 
      this.pressure, 
      this.vis, 
      this.cloud, 
      this.dew,});

  Now.fromJson(dynamic json) {
    obsTime = json['obsTime'];
    temp = json['temp'];
    feelsLike = json['feelsLike'];
    icon = json['icon'];
    text = json['text'];
    wind360 = json['wind360'];
    windDir = json['windDir'];
    windScale = json['windScale'];
    windSpeed = json['windSpeed'];
    humidity = json['humidity'];
    precip = json['precip'];
    pressure = json['pressure'];
    vis = json['vis'];
    cloud = json['cloud'];
    dew = json['dew'];
  }
  String? obsTime;
  String? temp;
  String? feelsLike;
  String? icon;
  String? text;
  String? wind360;
  String? windDir;
  String? windScale;
  String? windSpeed;
  String? humidity;
  String? precip;
  String? pressure;
  String? vis;
  String? cloud;
  String? dew;
Now copyWith({  String? obsTime,
  String? temp,
  String? feelsLike,
  String? icon,
  String? text,
  String? wind360,
  String? windDir,
  String? windScale,
  String? windSpeed,
  String? humidity,
  String? precip,
  String? pressure,
  String? vis,
  String? cloud,
  String? dew,
}) => Now(  obsTime: obsTime ?? this.obsTime,
  temp: temp ?? this.temp,
  feelsLike: feelsLike ?? this.feelsLike,
  icon: icon ?? this.icon,
  text: text ?? this.text,
  wind360: wind360 ?? this.wind360,
  windDir: windDir ?? this.windDir,
  windScale: windScale ?? this.windScale,
  windSpeed: windSpeed ?? this.windSpeed,
  humidity: humidity ?? this.humidity,
  precip: precip ?? this.precip,
  pressure: pressure ?? this.pressure,
  vis: vis ?? this.vis,
  cloud: cloud ?? this.cloud,
  dew: dew ?? this.dew,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['obsTime'] = obsTime;
    map['temp'] = temp;
    map['feelsLike'] = feelsLike;
    map['icon'] = icon;
    map['text'] = text;
    map['wind360'] = wind360;
    map['windDir'] = windDir;
    map['windScale'] = windScale;
    map['windSpeed'] = windSpeed;
    map['humidity'] = humidity;
    map['precip'] = precip;
    map['pressure'] = pressure;
    map['vis'] = vis;
    map['cloud'] = cloud;
    map['dew'] = dew;
    return map;
  }

}