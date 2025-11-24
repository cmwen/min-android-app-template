# Agent Configuration and Instructions

This document provides guidance for AI agents and automated tools working with this Flutter Android template repository.

## Repository Overview

This is a minimal Flutter application template designed primarily for Android development. It follows modern Flutter development practices and includes CI/CD setup for Android builds.

## Key Technologies

- **Framework**: Flutter 3.10.1+
- **Language**: Dart 3.10.1+
- **Primary Platform**: Android
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

# Run tests
flutter test

# Analyze code
flutter analyze
```

## Project Organization

This template is organized with Android as the primary platform:
- Android configuration is in the `android/` folder at the root
- Other platform configurations are archived in `archived/` folder
- Focus on Android-first development while maintaining Flutter's cross-platform capabilities

## Development Notes

- Primary target: Android applications
- Clean, minimal project structure
- Simple dependency management via pubspec.yaml
- Fast development with hot reload
