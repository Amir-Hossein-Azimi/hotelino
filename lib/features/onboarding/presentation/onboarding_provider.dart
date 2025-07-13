import 'package:Hotelino/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
   //set shey in motaghayer not = new onboardingrepository()
  final OnboardingRepository repository;
  OnboardingProvider(this.repository){
    _loadData();
  }

  int currentPage = 0;
  List<Map<String , String>> onboardingData = [];

  void _loadData() {
    onboardingData = repository.onboardingData;
    notifyListeners();
  }

  void updateCurrentPage(int index) {
    currentPage = index;
    notifyListeners();

  }


}