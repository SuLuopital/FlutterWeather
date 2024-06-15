String uviValueToString(double uvi) {
  if (uvi <= 2) {
    return 'Low';
  } else if (uvi <= 5) {
    return 'Medium';
  } else if (uvi <= 7) {
    return 'High';
  } else if (uvi <= 10) {
    return 'Very High';
  } else if (uvi >= 11) {
    return 'Extreme';
  }
  return 'Unknown';
}

String weatherCodeToString(int weatherCode) {
  switch (weatherCode) {
    case 100:
    case 103:
    case 150:
      return 'clear';

    case 101:
    case 102:
    case 151:
    case 152:
    case 153:
      return 'clouds';

    case 300:
    case 301:
    case 302:
    case 303:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 312:
    case 313:
    case 314:
    case 315:
    case 316:
    case 317:
    case 318:
    case 350:
    case 351:
    case 399:
      return 'rain';

    case 400:
    case 401:
    case 402:
    case 403:
    case 404:
    case 405:
    case 406:
    case 407:
    case 408:
    case 409:
    case 410:
    case 456:
    case 457:
    case 499:
      return 'snow';

    case 500:
    case 501:
    case 502:
    case 509:
    case 510:
    case 511:
    case 512:
    case 513:
    case 514:
    case 515:
      return 'fog';

    default:
      return 'unknown';
  }
}

String getWeatherImage(String input) {
  String weather = weatherCodeToString(int.parse(input.toString()));
  String assetPath = 'assets/images/';
  switch (weather) {
    case 'thunderstorm':
      return assetPath + 'Storm.png';

    case 'drizzle':
    case 'rain':
      return assetPath + 'Rainy.png';

    case 'snow':
      return assetPath + 'Snow.png';

    case 'clear':
      return assetPath + 'Sunny.png';

    case 'clouds':
      return assetPath + 'Cloudy.png';

    case 'mist':
    case 'fog':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'sand':
    case 'ash':
      return assetPath + 'Fog.png';

    case 'squall':
    case 'tornado':
      return assetPath + 'StormWindy.png';

    default:
      return assetPath + 'Cloud.png';
  }
}
