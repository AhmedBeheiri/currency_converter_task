## Currency Converter Flutter App

This document provides information on building, understanding, and the technology choices made for this Flutter application.

### Building the Project

**Prerequisites:**

* Flutter installation: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install) (version [latest_version])
* Android Studio / Visual Studio Code: https://code.visualstudio.com/

**Instructions:**

1. Clone the repository:
    ```bash
    git clone https://github.com/AhmedBeheiri/currency_converter_task.git
    ```
2. Run the project:
    - Open the project in your chosen development environment.
    - Navigate to the project directory in your terminal.
    - Run `flutter pub get` to download dependencies.
    
    - go to [free currency converter api](https://freecurrencyapi.com/) and get your api key.
    - create a file in the root of the project called `.env` and add the following line `FREE_CURRENCY_CONVERTER_API_KEY=[Your_API_key]`.
    - create an env folder at the root of the `lib` folder and create a file called `env.dart` and add the following code:
    ```dart 
   import 'package:envied/envied.dart';
   part 'env.g.dart';
   @Envied(path: '.env') // Customize path if needed
   abstract class Env {
   @EnviedField(varName: 'FREE_CURRENCY_CONVERTER_API_KEY')
   static const String apiKey = _Env.apiKey;
   }
    ```
   - Run `flutter pub run build_runner build` to generate required files.
   - Run `flutter run` to start the app.

### App Architecture

This project utilizes the **Bloc** design pattern for state management. Here's why:

* **Predictable & Testable:** State changes are explicit and follow a unidirectional flow, making testing and reasoning about app behavior easier.
* **Separation of Concerns:** UI widgets become declarative driven by the state, promoting cleaner code and separation of concerns.
* **Scalability:** Bloc scales well with complex apps due to its modular and independent nature.

### Image Loading

The **cached_network_image** library is used for image loading. Justification:

* **Caching & Network Management:** It efficiently caches images locally, reducing bandwidth usage and improving performance.
* **Robust Error Handling:** It gracefully handles network issues and displays cached images if necessary.
* **Built for Flutter:** Designed specifically for Flutter, it integrates seamlessly with widgets and animations.

### Database

This project utilizes the **Hive** database for data storage. Reasons for choosing Hive:

* **Local Storage:** Data is stored locally on the device, offering faster access and offline capabilities.
* **No Server Setup:** Eliminates the need for setting up and managing a dedicated server.
* **Simple & Flexible:** Hive provides a straightforward API for storing and retrieving data in various formats.
* **Performance:** It's fast and efficient, making it suitable for resource-intensive apps.
* **Perfect for app cases:** It's perfect for storing data with no relations as it is NoSql Database.
