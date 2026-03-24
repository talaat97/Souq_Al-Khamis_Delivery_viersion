# Souq Al-Khamis Delivery App

This is a Flutter-based delivery application designed to work with the **Souq Al-Khamis** E-commerce platform. The app is used by delivery personnel to view, accept, and manage customer orders.

## 🏗️ Architecture & State Management
This project utilizes **GetX** (`get: ^4.x.x`) for State Management, Dependency Injection, and Routing.
The codebase strongly adheres to the **MVC (Model-View-Controller)** or **Clean Architecture** directory pattern:
*   `lib/view/screens/`: Contains the UI of the application organized by feature.
*   `lib/controller/`: Contains GetX Controllers that handle the business logic.
*   `lib/data/`: Houses the raw data models and remote data sources (API services).
*   `lib/core/`: Contains shared resources such as API links (`link_api.dart`), HTTP helper functions (`crud.dart`), routing, and themes.
*   `lib/binding/`: Setup for GetX Bindings to initialize controllers securely.

## 📂 Project Structure Overview
*   **auth/**: Handles the login process for delivery personnel. Includes UI (`login.dart`), logic (`login_controller.dart`), and API requests (`login_data.dart`).
*   **home/**: The main dashboard layout and navigation.
*   **order/**: Core domain for delivery personnel involving:
    *   `pending`: View available orders that haven't been assigned yet.
    *   `accepted`: Orders that the delivery person has agreed to deliver.
    *   `archive`: History of all completed orders.
    *   `details`: Detailed view of a specific order (products, location, price).
*   **settings/**: Features for managing account and app preferences.

## 🔌 API Integration & Core Networking
The app communicates with a custom PHP/MySQL backend system.
*   **Endpoint Configuration**: `Applink` in `lib/link_api.dart` stores backend route configurations.
*   **HTTP Requests**: `crud.dart` acts as the master networking class using the `dartz` package for functional error handling (`Either<StatusRequest, Map>`).
*   **Error Handling**: Defined via `StatusRequest` enumerator handling loading states, success, offline failures, and server exceptions.

## 🚀 Key Features & Dependencies
Found in `pubspec.yaml`, the key components unlocking app functionality include:
*   **State & Routing**: `get`
*   **Networking & Handling**: `http`, `dartz`, `dio`
*   **Map & Geolocation**: `google_maps_flutter`, `geolocator`, `geocoding`, `flutter_polyline_points` (Used for calculating distance and determining delivery routes)
*   **Local Storage**: `shared_preferences`, `sqflite` (For caching sessions and delivery credentials step-by-step)
*   **Push Notifications (Firebase)**: `firebase_core`, `firebase_messaging` (Used for real-time alerts on new orders via the `servises` topic)
*   **UI / Assets**: `cached_network_image`, `lottie`, `flutter_svg`, `font_awesome_flutter`

## 👨‍💻 AI Engineering Context
**When interacting with this project:**
1.  **State Logic:** Always append logic into the respective `controller` file utilizing GetX `update()` or `Rx` variables before connecting to the `view`.
2.  **API Integration:** If you need to make a new API request, add the endpoint path to `lib/link_api.dart`, construct the matching data source class in `lib/data/datacorse/remote/`, and invoke it within the respective GetxController, managing UI states with the existing `StatusRequest` flow.
3.  **Localizations:** The app supports localizations (English/Arabic). Hardcoded strings in the UI should use `.tr` tags using keys defined in the localization map.
