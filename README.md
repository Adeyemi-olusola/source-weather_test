# Weather App

A Flutter application to display weather information using a free weather API. The app allows users to enter a city name, fetches weather details, and displays them with appropriate icons and background images based on weather conditions.

## Features

- Fetch weather information using a free weather API.
- Display weather details such as temperature, condition, wind speed, and humidity.
- Dynamic background images and icons based on weather conditions.
- Pull-to-refresh functionality.
- Animated loading state using Shimmer.



## Getting Started

To get started with this project, follow the instructions below.

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- A code editor such as Visual Studio Code or Android Studio.
- A device or emulator to run the app.

### Installation 

1. **Clone the repository:**

    ```bash
    git clone https://github.com/Adeyemi-olusola/weather_app.git
    cd weather_app
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Set up API key:**

    Replace `YOUR_API_KEY` in `weather_service.dart` with your actual API key from the weather service you are using.

    ```dart
    final String apiKey = 'YOUR_API_KEY';
    ```

4. **Run the app:**

    Connect your device or start an emulator, then run:

    ```bash
    flutter run
    ```

## Project Structure

- `lib/`
  - `components/` - Reusable UI components such as input fields, weather info, and shimmer effects.
  - `service/` - Weather service for API calls.
  - `utils/` - Utility classes such as text styles.
  - `screens/` - Screens for the application, including the main weather screen.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
