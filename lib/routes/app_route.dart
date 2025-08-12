import 'package:Hotelino/features/home/presentation/HomePage.dart';
import 'package:Hotelino/features/onboarding/presentation/onboarding_page.dart';
import 'package:Hotelino/routes/main_bottom_nav.dart';
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
    home: (ctx) => const MainBottomNav()

  };
}