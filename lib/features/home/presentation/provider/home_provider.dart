import 'package:Hotelino/core/constants/constants.dart';
import 'package:Hotelino/features/home/data/models/homepage_data.dart';
import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  HomeProvider(this._hotelRepository){
    fetchHotels();
  }

  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;

  final HomePageData _homePageData = HomePageDataConstants.homePageData;
  HomePageData get homePageData => _homePageData;


  //get from fetch hotels in hotel_repository
  fetchHotels () async {
    _hotels =  await _hotelRepository.fetchHotels();
    notifyListeners();
  }
  // Filter Method ----------------------------------------------------------
  List<Hotel> getPopularHotels() {
    return _hotels.where((hotel) => _homePageData.popular.contains(hotel.id)).toList();
  }
  List<Hotel> getSpecialOffersHotels() {
    return _hotels.where((hotel) => _homePageData.specialOffers.contains(hotel.id)).toList();
  }
  List<Hotel> getNewestHotels() {
    return _hotels.where((hotel) => _homePageData.newest.contains(hotel.id)).toList();
  }
  // story section ----------------------------------------------------------------------
  //shuffle cards and choose 3 image
  List<String> getStoryImages() {
    final shuffledHotels = List<Hotel> .from(hotels)..shuffle(); 
    return shuffledHotels.take(3).map((hotel) => hotel.images[0]).toList();
  }

  final List<String> _storyTitles = [
    "امکانات رفاهی هتل",
    "اقامت در قلب شهر",
    "لوکس ترین هتل ها"
  ];
  List<String> get storyTitles => _storyTitles;



}