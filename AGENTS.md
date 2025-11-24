# Agent Configuration and Instructions

This document provides guidance for AI agents and automated tools working with this Flutter template repository.

## Repository Overview

This is a minimal Flutter application template designed to serve as a starting point for cross-platform projects. It follows modern Flutter development practices and includes comprehensive CI/CD setup.

## Key Technologies

- **Framework**: Flutter 3.10.1+
- **Language**: Dart 3.10.1+
- **Platforms**: Android, iOS, Web, Linux, macOS, Windows
- **Package Manager**: pub (pubspec.yaml)
- **Testing**: flutter_test, Widget testing
- **Linting**: flutter_lints 6.0.0

## Flutter Commands

### Basic Commands
```bash
# Get dependencies
flutter pub get

# Run app
flutter run

# Build release
flutter build apk           # Android APK
flutter build appbundle     # Android App Bundle
flutter build ios           # iOS
flutter build web           # Web

# Run tests
flutter test

# Analyze code
flutter analyze
```

## Migration Notes

This project was migrated from an Android-only template to Flutter to escape:
- ❌ Gradle dependency conflicts
- ❌ Long build times
- ❌ Complex configuration

Flutter benefits:
- ✅ Simple dependency management
- ✅ Fast hot reload
- ✅ Cross-platform from single codebase
