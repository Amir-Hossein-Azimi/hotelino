# Hotelino

A simple hotel booking app built with Flutter, using Provider for state management.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

  * Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
  * Dart SDK: [https://dart.dev/get-dart](https://dart.dev/get-dart)

### Installation

1.  Clone the repo
    ```sh
    git clone https://github.com/Amir-Hossein-Azimi/hotelino.git
    ```
2.  Install packages
    ```sh
    flutter pub get
    ```
3.  Run the app
    ```sh
    flutter run
    ```

## Project Structure

This project follows a feature-based architecture, which is a variation of Clean Architecture. The goal is to create a modular and scalable codebase.

```
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   └── utils/
├── features/
│   ├── booking/
│   ├── favorite/
│   ├── home/
│   ├── hotel_detail/
│   ├── onboarding/
│   └── profile/
├── routes/
│   ├── app_route.dart
│   └── main_bottom_nav.dart
└── shared/
    ├── services/
    └── widgets/
```

### `core`

This directory contains the core functionalities of the application.

  * **`constants`**: Application-wide constants like colors, strings, etc.
  * **`theme`**: Application theme and styling.
  * **`utils`**: Utility functions and helper classes.

### `features`

Each feature of the application is a self-contained module in this directory. For example, the `home` feature contains all the files related to the home screen.

  * **`booking`**: Contains the booking feature.
  * **`favorite`**: Contains the favorite hotels feature.
  * **`home`**: Contains the home screen feature.
  * **`hotel_detail`**: Contains the hotel detail feature.
  * **`onboarding`**: Contains the onboarding screens.
  * **`profile`**: Contains the user profile feature.

### `routes`

This directory contains the navigation logic of the application.

  * **`app_route.dart`**: Defines the application routes.
  * **`main_bottom_nav.dart`**: Implements the main bottom navigation bar.

### `shared`

This directory contains shared code that can be used across multiple features.

  * **`services`**: Shared services like API calls, database, etc.
  * **`widgets`**: Shared widgets that are used in multiple screens.

-----

<br>

# Hotelino Hotel Booking App (App Description)

[](https://flutter.dev/)

**Hotelino** is a comprehensive application for searching and booking hotels in Iran and around the world. With Hotelino, users can easily find the best and most economical accommodations with just a few clicks, ensuring a unique travel experience.

This project is designed to simplify the hotel selection and booking process, featuring a modern user interface and a full range of functionalities.

## 📸 Screenshots

Here you can see various views of the application.


| Home Screen | Hotel Details | User Profile |
| :---: | :---: | :---: |
| ![Home.png](screenshot/Home.png) | ![Hotel_detail.png](screenshot/Hotel_detail.png) | ![profile.png](screenshot/profile.png) 
| **Search & Filter** | **Favorites Screen** | **Booking Form** |
| ![search.png](screenshot/search.png) | ![favorite.png](screenshot/favorite.png) | ![booking.png](screenshot/booking.png) | 

-----

## ✨ Key Features

Based on the provided video showcase, the Hotelino app includes the following features:

  * **🏡 Extensive Hotel Search:**

      * including hotels, motels, rooms, suites, and more.
      * Coverage of both domestic (e.g., Tehran, Mashhad) and international hotels (e.g., Istanbul, Brussels).

  * **🔎 Filters:**

  * **📄 Comprehensive Hotel Details Page:**

      * Displays complete information for each hotel, including:
          * Name and exact address.
          * High-quality image gallery.
          * Amenities (e.g., pool, gym, air conditioning).
          * Detailed descriptions of the hotel and its services.
          * Location view on an interactive map.

  * **👤 Full-Fledged User Profile:**

      * View and edit user information.
      * Access a list of **Favorite Hotels**.
      * Manage notifications.
      * Password recovery options.
      * Payment settings.

  * **❤️ Favorites System:**

      * Users can add hotels to their favorites list for easy access later.

  * **📅 Simple Booking Process:**

      * A user-friendly booking form to enter details:
          * Full Name.
          * Destination.
          * Check-in/Check-out Dates.
          * Number of Guests.
          * Contact number with international country code selection (e.g., Iran, France).

  * **🎨 Modern & Attractive UI:**

      * Beautiful design with smooth animations to enhance the user experience.
      * Supports the operating system's native Dark Mode and Light Mode.
