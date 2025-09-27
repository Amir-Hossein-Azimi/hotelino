# Hotelino

A simple hotel booking app built with Flutter, using Provider for state management.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
*   Dart SDK: [https://dart.dev/get-dart](https://dart.dev/get-dart)

### Installation

1.  Clone the repo
    ```sh
    git clone https://github.com/your_username/hotelino.git
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

*   **`constants`**: Application-wide constants like colors, strings, etc.
*   **`theme`**: Application theme and styling.
*   **`utils`**: Utility functions and helper classes.

### `features`

Each feature of the application is a self-contained module in this directory. For example, the `home` feature contains all the files related to the home screen.

*   **`booking`**: Contains the booking feature.
*   **`favorite`**: Contains the favorite hotels feature.
*   **`home`**: Contains the home screen feature.
*   **`hotel_detail`**: Contains the hotel detail feature.
*   **`onboarding`**: Contains the onboarding screens.
*   **`profile`**: Contains the user profile feature.

### `routes`

This directory contains the navigation logic of the application.

*   **`app_route.dart`**: Defines the application routes.
*   **`main_bottom_nav.dart`**: Implements the main bottom navigation bar.

### `shared`

This directory contains shared code that can be used across multiple features.

*   **`services`**: Shared services like API calls, database, etc.
*   **`widgets`**: Shared widgets that are used in multiple screens.