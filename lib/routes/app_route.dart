import 'package:Hotelino/features/home/HomePage.dart';
import 'package:Hotelino/features/onboarding/OnboardingPage.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String home = '/';
  static const String hotelDetail = '/hotel-detail';
  static const String bookingForm = '/booking-form';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String onboarding = '/onboarding';

  static final Map<String , WidgetBuilder> routes = {

    onboarding: (ctx) => const OnboardingPage(),
    home: (ctx) => const Homepage()

  };
}