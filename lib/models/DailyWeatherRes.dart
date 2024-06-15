class DailyWeatherRes {
  DailyWeatherRes({
      this.code, 
      this.updateTime, 
      this.fxLink, 
      this.daily, 
      this.refer,});

  DailyWeatherRes.fromJson(dynamic json) {
    code = json['code'];
    updateTime = json['updateTime'];
    fxLink = json['fxLink'];
    if (json['daily'] != null) {
      daily = [];
      json['daily'].forEach((v) {
        daily?.add(Daily.fromJson(v));
      });
    }
    refer = json['refer'] != null ? Refer.fromJson(json['refer']) : null;
  }
  String? code;
  String? updateTime;
  String? fxLink;
  List<Daily>? daily;
  Refer? refer;
DailyWeatherRes copyWith({  String? code,
  String? updateTime,
  String? fxLink,
  List<Daily>? daily,
  Refer? refer,
}) => DailyWeatherRes(  code: code ?? this.code,
  updateTime: updateTime ?? this.updateTime,
  fxLink: fxLink ?? this.fxLink,
  daily: daily ?? this.daily,
  refer: refer ?? this.refer,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['updateTime'] = updateTime;
    map['fxLink'] = fxLink;
    if (daily != null) {
      map['daily'] = daily?.map((v) => v.toJson()).toList();
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

class Daily {
  Daily({
      this.fxDate, 
      this.sunrise, 
      this.sunset, 
      this.moonrise, 
      this.moonset, 
      this.moonPhase, 
      this.moonPhaseIcon, 
      this.tempMax, 
      this.tempMin, 
      this.iconDay, 
      this.textDay, 
      this.iconNight, 
      this.textNight, 
      this.wind360Day, 
      this.windDirDay, 
      this.windScaleDay, 
      this.windSpeedDay, 
      this.wind360Night, 
      this.windDirNight, 
      this.windScaleNight, 
      this.windSpeedNight, 
      this.humidity, 
      this.precip, 
      this.pressure, 
      this.vis, 
      this.cloud, 
      this.uvIndex,});

  Daily.fromJson(dynamic json) {
    fxDate = json['fxDate'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moonPhase'];
    moonPhaseIcon = json['moonPhaseIcon'];
    tempMax = json['tempMax'];
    tempMin = json['tempMin'];
    iconDay = json['iconDay'];
    textDay = json['textDay'];
    iconNight = json['iconNight'];
    textNight = json['textNight'];
    wind360Day = json['wind360Day'];
    windDirDay = json['windDirDay'];
    windScaleDay = json['windScaleDay'];
    windSpeedDay = json['windSpeedDay'];
    wind360Night = json['wind360Night'];
    windDirNight = json['windDirNight'];
    windScaleNight = json['windScaleNight'];
    windSpeedNight = json['windSpeedNight'];
    humidity = json['humidity'];
    precip = json['precip'];
    pressure = json['pressure'];
    vis = json['vis'];
    cloud = json['cloud'];
    uvIndex = json['uvIndex'];
  }
  String? fxDate;
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonPhaseIcon;
  String? tempMax;
  String? tempMin;
  String? iconDay;
  String? textDay;
  String? iconNight;
  String? textNight;
  String? wind360Day;
  String? windDirDay;
  String? windScaleDay;
  String? windSpeedDay;
  String? wind360Night;
  String? windDirNight;
  String? windScaleNight;
  String? windSpeedNight;
  String? humidity;
  String? precip;
  String? pressure;
  String? vis;
  String? cloud;
  String? uvIndex;
Daily copyWith({  String? fxDate,
  String? sunrise,
  String? sunset,
  String? moonrise,
  String? moonset,
  String? moonPhase,
  String? moonPhaseIcon,
  String? tempMax,
  String? tempMin,
  String? iconDay,
  String? textDay,
  String? iconNight,
  String? textNight,
  String? wind360Day,
  String? windDirDay,
  String? windScaleDay,
  String? windSpeedDay,
  String? wind360Night,
  String? windDirNight,
  String? windScaleNight,
  String? windSpeedNight,
  String? humidity,
  String? precip,
  String? pressure,
  String? vis,
  String? cloud,
  String? uvIndex,
}) => Daily(  fxDate: fxDate ?? this.fxDate,
  sunrise: sunrise ?? this.sunrise,
  sunset: sunset ?? this.sunset,
  moonrise: moonrise ?? this.moonrise,
  moonset: moonset ?? this.moonset,
  moonPhase: moonPhase ?? this.moonPhase,
  moonPhaseIcon: moonPhaseIcon ?? this.moonPhaseIcon,
  tempMax: tempMax ?? this.tempMax,
  tempMin: tempMin ?? this.tempMin,
  iconDay: iconDay ?? this.iconDay,
  textDay: textDay ?? this.textDay,
  iconNight: iconNight ?? this.iconNight,
  textNight: textNight ?? this.textNight,
  wind360Day: wind360Day ?? this.wind360Day,
  windDirDay: windDirDay ?? this.windDirDay,
  windScaleDay: windScaleDay ?? this.windScaleDay,
  windSpeedDay: windSpeedDay ?? this.windSpeedDay,
  wind360Night: wind360Night ?? this.wind360Night,
  windDirNight: windDirNight ?? this.windDirNight,
  windScaleNight: windScaleNight ?? this.windScaleNight,
  windSpeedNight: windSpeedNight ?? this.windSpeedNight,
  humidity: humidity ?? this.humidity,
  precip: precip ?? this.precip,
  pressure: pressure ?? this.pressure,
  vis: vis ?? this.vis,
  cloud: cloud ?? this.cloud,
  uvIndex: uvIndex ?? this.uvIndex,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fxDate'] = fxDate;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['moonrise'] = moonrise;
    map['moonset'] = moonset;
    map['moonPhase'] = moonPhase;
    map['moonPhaseIcon'] = moonPhaseIcon;
    map['tempMax'] = tempMax;
    map['tempMin'] = tempMin;
    map['iconDay'] = iconDay;
    map['textDay'] = textDay;
    map['iconNight'] = iconNight;
    map['textNight'] = textNight;
    map['wind360Day'] = wind360Day;
    map['windDirDay'] = windDirDay;
    map['windScaleDay'] = windScaleDay;
    map['windSpeedDay'] = windSpeedDay;
    map['wind360Night'] = wind360Night;
    map['windDirNight'] = windDirNight;
    map['windScaleNight'] = windScaleNight;
    map['windSpeedNight'] = windSpeedNight;
    map['humidity'] = humidity;
    map['precip'] = precip;
    map['pressure'] = pressure;
    map['vis'] = vis;
    map['cloud'] = cloud;
    map['uvIndex'] = uvIndex;
    return map;
  }

}