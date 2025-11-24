# Minimal Android App Template

A minimal, clean Flutter application template primarily focused on Android development. This template provides a simple starting point for Flutter Android projects while keeping the codebase clean and organized.

## Why This Template?

- ✨ **Android-First**: Optimized for Android development
- 📦 **Simple Dependencies**: Manage packages with `pubspec.yaml`
- 🎨 **Material Design**: Beautiful UI components out of the box
- 🔥 **Hot Reload**: See your changes instantly
- ⚡ **Fast Development**: Quick iteration cycles
- 🧪 **Testing Built-in**: Widget, integration, and unit testing support
- 📱 **Modern**: Using Flutter 3.10.1+ and Dart 3+

## Quick Start

### Prerequisites

- Flutter SDK 3.10.1 or higher
- Dart 3.10.1 or higher
- Android Studio or Android SDK
- Java Development Kit (JDK) 17 or higher

### Installation

```bash
# Clone this repository
git clone https://github.com/yourusername/min-android-app-template.git
cd min-android-app-template

# Get dependencies
flutter pub get

# Run on Android device or emulator
flutter run

# Or explicitly specify Android
flutter run -d android
```

### Build

```bash
# Build APK for Android (debug)
flutter build apk --debug

# Build APK for Android (release)
flutter build apk --release

# Build App Bundle for Android (Play Store)
flutter build appbundle --release

# Build for specific architecture
flutter build apk --target-platform android-arm64
```

## Project Structure

```
min-android-app-template/
├── lib/
│   └── main.dart           # Main application entry point
├── test/
│   └── widget_test.dart    # Widget tests
├── android/                # Android-specific configuration
├── archived/               # Other platform folders (not main focus)
│   ├── ios/
│   ├── web/
│   ├── linux/
│   ├── macos/
│   └── windows/
├── pubspec.yaml            # Dependencies and project configuration
└── analysis_options.yaml   # Linting rules
```

## Development

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/widget_test.dart
```

### Linting

```bash
# Analyze code
flutter analyze

# Format code
flutter format .
```

### Adding Dependencies

Edit `pubspec.yaml` and run:

```bash
flutter pub get
```

That's it! No Gradle sync, no dependency resolution nightmares! 🎉

## CI/CD

This template includes GitHub Actions workflows for:

- **Build**: Automated Android builds (APK and App Bundle)
- **Test**: Run tests on every push
- **Release**: Create releases with built APK and App Bundle
- **Code Quality**: Static analysis and linting

See `.github/workflows/` for configuration.

## Configuration

### App Name and Bundle ID

Edit the following files:

- `pubspec.yaml`: Update `name` and `description`
- `android/app/build.gradle`: Update `applicationId` and app name

### Version

Update version in `pubspec.yaml`:

```yaml
version: 1.0.0+1
```

Format: `version: MAJOR.MINOR.PATCH+BUILD_NUMBER`

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language](https://dart.dev/)
- [Flutter Packages](https://pub.dev/)
- [Flutter Samples](https://flutter.github.io/samples/)
- [Widget Catalog](https://docs.flutter.dev/ui/widgets)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Troubleshooting

### Common Issues

**Problem**: `flutter: command not found`
```bash
# Install Flutter
# macOS:
brew install --cask flutter

# Or download from https://docs.flutter.dev/get-started/install
```

**Problem**: "No devices found"
```bash
# Check available devices
flutter devices

# Start Android emulator
flutter emulators
flutter emulators --launch <emulator_id>

# Or connect a physical Android device via USB with debugging enabled
```

**Problem**: Dependency conflicts
```bash
# Update dependencies
flutter pub upgrade

# Clean and rebuild
flutter clean
flutter pub get
```

## About This Template

This template provides a clean, minimal starting point for Flutter Android development. While Flutter supports multiple platforms, this template is organized with Android as the primary focus, keeping other platform configurations in an archived folder to maintain a clean project root.

---

**Start building your Android app with Flutter!** 🚀
