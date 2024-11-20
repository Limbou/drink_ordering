
# Drink Ordering App

This repository contains the Drink Ordering app built with Flutter, using [Melos](https://melos.invertase.dev/) for package management.
  
---  

## Getting Started

Follow these steps to run the app locally.

### Prerequisites

1. Install [Flutter](https://flutter.dev/docs/get-started/install) on your system.
2. Verify your Flutter installation:

  ```bash  
  flutter doctor  
 ```
Ensure all required tools (Dart, Android Studio/Xcode, etc.) are installed and set up.

3. Install Melos globally:
  ```bash  
  pub global activate melos  
 ```
Ensure the Melos binary is accessible by adding the Dart bin directory to your system’s PATH if needed. You can check if Melos is installed by running:
   ```bash  
   melos --version  
 ```  
### Running the App

1. Clone the repository:

   ```bash  
   git clone https://github.com/your-username/drink-ordering.git  
   cd drink-ordering  
    ```

2.  Bootstrap the project with Melos to get dependencies:
    ```bash
    melos bootstrap
    ```
3.  To target specific platforms:

• **Android**: Ensure an emulator is running or connect an Android device.

•  **iOS**: Use a macOS system with an iOS simulator or connect an iPhone.

•  **Web**: Run in a browser with:

```bash
flutter run -d chrome
```


## Additional features

### 1. Currency selector
You can change the currency on either products list page or order summary page. Changing it will take place globally.

### 2.  Theme support
By using theme colors and fonts app is ready to support light mode. Just introduce new set of colors for light mode, add it to the MaterialApp and you're all set.

### 3. Multi language support
By using intl and flutter_localizations, the app is ready to support multiple languages. To add a new one, create a new arb file with matching keys and translations for a given language. Then regenerate the translations config using `flutter pub get`  and you're all set.
