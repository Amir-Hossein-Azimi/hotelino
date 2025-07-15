import 'dart:convert';

import 'package:Hotelino/core/constants/constants.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:flutter/services.dart';

class JsonDataService {
  Future<List<Hotel>> loadHotels() async {
    final String response  = await rootBundle.loadString(AppConstants.hotelsData);
    final Map<String , dynamic> jsonData = json.decode(response);

    final List<dynamic> hotelsList = jsonData["hotels"];

    //to iterator
    return hotelsList.map((hotel) =>  Hotel.fromJson(hotel as Map<String , dynamic>)).toList();
  }
}