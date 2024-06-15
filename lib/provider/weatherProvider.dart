import 'package:flutter/material.dart';
import 'package:flutter_weather/models/DailyWeatherRes.dart';
import 'package:flutter_weather/models/HourlyWeatherRes.dart';
import 'package:flutter_weather/models/LocationLookUpRes.dart';
import 'package:flutter_weather/network/dio_manager.dart';
import 'package:geolocator/geolocator.dart';

import 'package:latlong2/latlong.dart';

import '../models/WeatherNow.dart';

class WeatherProvider with ChangeNotifier {
  // String apiKey = 'Enter Your API Key';
  String apiKey = '4060f45928104d01b0b57c0b420e13f8';

  late WeatherNow weatherNow;
  // late Location locationLookUp;

  LatLng? currentLocation;
  // int? locationCode = 0;
  List<Hourly> hourlyWeather = [];
  List<Daily> dailyWeather = [];
  List<Location> locationsLookup = [];

  bool isLoading = false;
  bool isRequestError = false;
  bool isSearchError = false;
  bool isLocationServiceEnabled = false;
  LocationPermission? locationPermission;
  bool isCelsius = true;

  String get measurementUnit => isCelsius ? '°C' : '°F';

  Future<Position?> requestLocation(BuildContext context) async {
    debugPrint('request location');
    isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    debugPrint('isLocationServiceEnabled: $isLocationServiceEnabled');

    notifyListeners();

    if (!isLocationServiceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location service disabled')),
      );
      return Future.error('Location services are disabled.');
    }

    locationPermission = await Geolocator.checkPermission();
    debugPrint('locationPermission: $locationPermission');

    if (locationPermission == LocationPermission.denied) {
      isLoading = false;
      notifyListeners();
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Permission denied'),
        ));
        return Future.error('Location permissions are denied');
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Location permissions are permanently denied, Please enable manually from app settings',
        ),
      ));
      return Future.error('Location permissions are permanently denied');
    }

    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        timeLimit: Duration(seconds: 30),
      );
    } catch (e) {
      debugPrint('getCurrentPosition error: ${e.toString()}');
    }

    return position;
    // return await Geolocator.getCurrentPosition();
  }

  Future<void> getWeatherData(
    BuildContext context, {
    bool notify = false,
  }) async {
    isLoading = true;
    isRequestError = false;
    isSearchError = false;
    if (notify) notifyListeners();

    Position? locData = await requestLocation(context);
    debugPrint('locData: ${locData?.toJson().toString()}');

    if (locData == null) {
      isLoading = false;
      notifyListeners();
      return;
    }

    try {
      currentLocation = LatLng(locData.latitude, locData.longitude);
      await getLocationCode(currentLocation!);
      await getCurrentWeather();
      await get24HoursWeather();
      await get7DaysWeather();
    } catch (e) {
      print(e);
      isRequestError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getLocationCode(LatLng location) async {
    debugPrint(
        'lat: ${location.latitude}, long: ${location.longitude}, apikey: $apiKey');
    try {
      final uri = Uri.parse(
          'https://geoapi.qweather.com/v2/city/lookup?location=${location.longitude},${location.latitude}&key=$apiKey&lang=zh');
      final response = await DioManager().dio.getUri(uri);
      final extractedData = response.data as Map<String, dynamic>;
      LocationLookUpRes res = LocationLookUpRes.fromJson(extractedData);
      locationsLookup = res.location ?? [];

    } catch (error) {
      print('error: ${error.toString()}');
      isLoading = false;
      this.isRequestError = true;
    }
  }

  Future<void> getCurrentWeather() async {
    String locationCode = locationsLookup[0].id ?? '101280109';
    try {
      final uri = Uri.parse(
          'https://devapi.qweather.com/v7/weather/now?location=$locationCode&key=$apiKey&lang=zh');
      final response = await DioManager().dio.getUri(uri);
      final extractedData = response.data as Map<String, dynamic>;
      weatherNow = WeatherNow.fromJson(extractedData);
    } catch (error) {
      print('error: ${error.toString()}');
      isLoading = false;
      this.isRequestError = true;
    }
  }

  Future<void> get24HoursWeather() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await DioManager()
          .dio
          .get('https://devapi.qweather.com/v7/weather/24h', queryParameters: {
        'location': locationsLookup[0].id,
        'key': apiKey,
        'lang': 'zh'
      });
      HourlyWeatherRes dailyData =
          HourlyWeatherRes.fromJson(response.data as Map<String, dynamic>);
      hourlyWeather = dailyData.hourly!;
    } catch (error) {
      print(error);
      isLoading = false;
      this.isRequestError = true;
    }
  }

  Future<void> get7DaysWeather() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await DioManager()
          .dio
          .get('https://devapi.qweather.com/v7/weather/7d', queryParameters: {
        'location': locationsLookup[0].id,
        'key': apiKey,
        'lang': 'zh'
      });
      DailyWeatherRes dailyData =
          DailyWeatherRes.fromJson(response.data as Map<String, dynamic>);
      dailyWeather = dailyData.daily!;
    } catch (error) {
      print(error);
      isLoading = false;
      this.isRequestError = true;
    }
  }

  Future<void> searchWeather(String location) async {
    // isLoading = true;
    // notifyListeners();
    // isRequestError = false;
    // print('search');
    // try {
    //   GeocodeData? geocodeData;
    //   geocodeData = await locationToLatLng(location);
    //   if (geocodeData == null) throw Exception('Unable to Find Location');
    //   await getCurrentWeather(geocodeData.latLng);
    //   // await getDailyWeather(geocodeData.latLng);
    //   // replace location name with data from geocode
    //   // because data from certain lat long might return local area name
    //   weather.city = geocodeData.name;
    // } catch (e) {
    //   print(e);
    //   isSearchError = true;
    // } finally {
    //   isLoading = false;
    //   notifyListeners();
    // }
  }

  void switchTempUnit() {
    isCelsius = !isCelsius;
    notifyListeners();
  }
}
