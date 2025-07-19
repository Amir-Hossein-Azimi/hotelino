import 'package:Hotelino/features/home/data/models/hotel.dart';
import 'package:Hotelino/features/home/data/models/profile.dart';
import 'package:Hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:Hotelino/features/home/data/repositories/profile_repository.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _profileRepository;
  final HotelRepository _hotelRepository;

  List<Hotel> _hotels = [];
  Profile? _profile;
  Profile? get profile => _profile;
  
  ProfileProvider(this._profileRepository , this._hotelRepository){
    loadUserProfile();
  }

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
  }

  loadUserProfile() async {
    _profile = await _profileRepository.fetchUserProfile();
  }

  // Recently viewd Hotels ----------------------------------------------------------------
    final List<String> _recentlyViewdHotels = [];
    
    List<Hotel> get recentlyViewdHotels => _hotels.where((hotel) => _recentlyViewdHotels.contains(hotel.id)).toList();

    void addRecentlyViewed(String hotelId){
      if(!recentlyViewdHotels.contains(hotelId)) {
        _recentlyViewdHotels.add(hotelId);
        notifyListeners();
      } else {
        _recentlyViewdHotels.remove(hotelId);
        _recentlyViewdHotels.add(hotelId);
        notifyListeners();
      }
    }

}