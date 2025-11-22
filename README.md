# Minimal Android App Template

A minimal Android app template with modern tooling and CI/CD setup.

## 🤖 New: AI-Assisted Development Guides

**Building your first Android app with AI?** Check out our comprehensive guides:
- 🌱 [**Beginner's Guide**](docs/AI_BEGINNER_GUIDE.md) - Never coded before? Start here!
- 🎓 [**Intermediate Guide**](docs/AI_INTERMEDIATE_GUIDE.md) - Know programming but new to Android?
- 🚀 [**Advanced Guide**](docs/AI_ADVANCED_GUIDE.md) - Experienced developer? Accelerate with AI!
- 📝 [**Prompt Templates**](docs/AI_PROMPT_TEMPLATES.md) - Ready-to-use prompts for common tasks

👉 **[Start with the AI Prompting Guide](AI_PROMPTING_GUIDE.md)** to learn how to effectively use AI assistants (ChatGPT, Claude, GitHub Copilot) to build Android apps!

## Features

- ✅ **Latest Android SDK 36** (Target SDK 36, Min SDK 24)
- ✅ **Gradle 9.2.1** with Kotlin DSL
- ✅ **AGP 8.13.0** (Android Gradle Plugin)
- ✅ **Kotlin 2.2.21**
- ✅ **AndroidX** libraries
- ✅ **Material Design** components
- ✅ **View Binding** enabled

## CI/CD Workflows

### GitHub Actions
- **Build** - Automated builds on push/PR to main and develop branches
- **Release** - Self-signed release builds on tags (v*) or manual trigger
- **Beta** - Beta builds on beta/develop branches with beta app ID suffix
- **CodeQL** - Security code scanning on schedule and PRs

### Dependabot
- Automated dependency updates with grouping to reduce PRs
- Groups: AndroidX, Kotlin, Testing, Google/Material, Build Tools, GitHub Actions
- Weekly updates on Mondays

## Build Variants

- **Debug** - Development builds with debugging enabled
- **Release** - Production builds with ProGuard/R8 minification
- **Beta** - Beta testing builds with .beta suffix

## Getting Started

### Prerequisites
- JDK 17 or higher
- Android SDK with API 36
- Gradle 9.2.1 (included via wrapper)
- Internet access to maven.google.com for dependency downloads

### Clone and Build
```bash
git clone https://github.com/cmwen/cmwen-min-android-app-template.git
cd cmwen-min-android-app-template
./gradlew build
```

### Run Tests
```bash
./gradlew test
```

### Build Release APK
```bash
# Self-signed (for testing)
./gradlew assembleRelease

# With your own keystore
export ANDROID_KEYSTORE_FILE=/path/to/your/keystore.jks
export ANDROID_KEYSTORE_PASSWORD=your_store_password
export ANDROID_KEY_ALIAS=your_key_alias
export ANDROID_KEY_PASSWORD=your_key_password
./gradlew assembleRelease
```

### Build Beta APK
```bash
./gradlew assembleBeta
```

## Development Container

This project includes a devcontainer configuration for VS Code:
- Pre-configured with JDK 17, Android SDK, and Gradle
- Includes useful VS Code extensions
- Ready for immediate development

To use:
1. Install Docker and VS Code Remote - Containers extension
2. Open project in VS Code
3. Click "Reopen in Container" when prompted

## Project Structure

```
.
├── app/                        # Main application module
│   ├── src/
│   │   └── main/
│   │       ├── java/          # Kotlin/Java source files
│   │       ├── res/           # Resources (layouts, strings, etc.)
│   │       └── AndroidManifest.xml
│   ├── build.gradle.kts       # App-level Gradle config
│   └── proguard-rules.pro     # ProGuard rules
├── .github/
│   ├── workflows/             # GitHub Actions workflows
│   └── dependabot.yml         # Dependabot configuration
├── .devcontainer/             # Dev container configuration
├── build.gradle.kts           # Root-level Gradle config
├── settings.gradle.kts        # Gradle settings
└── gradle/                    # Gradle wrapper files
```

## Customization

### Change Package Name
1. Rename the package in `app/src/main/java/com/cmwen/minandroidtemplate/`
2. Update `namespace` in `app/build.gradle.kts`
3. Update `applicationId` in `app/build.gradle.kts`

### Change App Name
Edit `app/src/main/res/values/strings.xml`:
```xml
<string name="app_name">Your App Name</string>
```

### Configure Signing for Release
Set these secrets in GitHub repository settings:
- `ANDROID_KEYSTORE_BASE64` - Base64 encoded keystore file
- `ANDROID_KEYSTORE_PASSWORD` - Keystore password
- `ANDROID_KEY_ALIAS` - Key alias
- `ANDROID_KEY_PASSWORD` - Key password

## Documentation

### AI-Assisted Development Guides
- **[AI Prompting Guide](AI_PROMPTING_GUIDE.md)** - Complete guide to using AI for Android development
- **[Beginner's Guide](docs/AI_BEGINNER_GUIDE.md)** - For those new to programming and Android
- **[Intermediate Guide](docs/AI_INTERMEDIATE_GUIDE.md)** - For developers new to Android
- **[Advanced Guide](docs/AI_ADVANCED_GUIDE.md)** - For experienced Android developers
- **[Prompt Templates](docs/AI_PROMPT_TEMPLATES.md)** - Ready-to-use prompt templates

### Technical Documentation
- [AGENTS.md](AGENTS.md) - Agent configuration and instructions
- [TESTING.md](TESTING.md) - Testing procedures
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guidelines

### External Resources
- [Android Developer Guide](https://developer.android.com/)
- [Gradle User Guide](https://docs.gradle.org/)

## License

This template is available for use under your preferred license.

## Contributing

This is a template repository. Feel free to use it as a starting point for your Android projects!