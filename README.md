# Minimal Flutter App Template

A minimal, clean Flutter application template designed to escape Android dependency hell! This template provides a simple starting point for Flutter projects with support for Android, iOS, Web, Linux, macOS, and Windows.

## Why Flutter?

No more Gradle nightmares, dependency conflicts, or spending hours configuring build systems. Flutter just works! ✨

## Features

- 🚀 **Cross-platform**: Build for Android, iOS, Web, Linux, macOS, and Windows from a single codebase
- 📦 **Simple Dependencies**: Manage packages with `pubspec.yaml` - no more Gradle hell
- 🎨 **Material Design**: Beautiful UI components out of the box
- 🔥 **Hot Reload**: See your changes instantly
- ⚡ **Fast Development**: No more waiting for Gradle builds
- 🧪 **Testing Built-in**: Widget, integration, and unit testing support
- 📱 **Modern**: Using Flutter 3.10.1+ and Dart 3+

## Quick Start

### Prerequisites

- Flutter SDK 3.10.1 or higher
- Dart 3.10.1 or higher
- For Android: Android Studio or Android SDK
- For iOS: Xcode (macOS only)

### Installation

```bash
# Clone this repository
git clone https://github.com/yourusername/min-flutter-template.git
cd min-flutter-template

# Get dependencies
flutter pub get

# Run on your preferred platform
flutter run

# Or specify a device
flutter run -d chrome        # Web
flutter run -d macos          # macOS
flutter run -d android        # Android
flutter run -d ios            # iOS
```

### Build

```bash
# Build APK for Android
flutter build apk

# Build App Bundle for Android (Play Store)
flutter build appbundle

# Build for iOS
flutter build ios

# Build for Web
flutter build web

# Build for Desktop
flutter build macos
flutter build linux
flutter build windows
```

## Project Structure

```
min_flutter_template/
├── lib/
│   └── main.dart           # Main application entry point
├── test/
│   └── widget_test.dart    # Widget tests
├── android/                # Android-specific configuration
├── ios/                    # iOS-specific configuration
├── web/                    # Web-specific configuration
├── linux/                  # Linux-specific configuration
├── macos/                  # macOS-specific configuration
├── windows/                # Windows-specific configuration
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

- **Build**: Automated builds for all platforms
- **Test**: Run tests on every push
- **Release**: Create releases with built artifacts
- **Code Quality**: Static analysis and linting

See `.github/workflows/` for configuration.

## Configuration

### App Name and Bundle ID

Edit the following files:

- `pubspec.yaml`: Update `name` and `description`
- `android/app/build.gradle`: Update `applicationId`
- `ios/Runner.xcodeproj/project.pbxproj`: Update `PRODUCT_BUNDLE_IDENTIFIER`

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

# Enable web
flutter config --enable-web

# Enable desktop
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
flutter config --enable-windows-desktop
```

**Problem**: Dependency conflicts
```bash
# Update dependencies
flutter pub upgrade

# Clean and rebuild
flutter clean
flutter pub get
```

## Migrated from Android

This project was migrated from a pure Android template to escape dependency hell. Welcome to the Flutter side! 🦋

---

**Say goodbye to Android dependency hell and hello to Flutter simplicity!** 🚀
