# Agent Configuration and Instructions

This document provides guidance for AI agents and automated tools working with this Android template repository.

## Repository Overview

This is a minimal Android application template designed to serve as a starting point for new Android projects. It follows modern Android development practices and includes comprehensive CI/CD setup.

## Key Technologies

- **Language**: Kotlin 2.0.0
- **Build System**: Gradle 8.11.1 with Kotlin DSL
- **Android Gradle Plugin**: 8.5.2
- **Target SDK**: 34 (Android 14)
- **Minimum SDK**: 24 (Android 7.0)

## Project Structure

### Build Configuration Files
- `build.gradle.kts` - Root build configuration
- `settings.gradle.kts` - Project settings and module inclusion
- `app/build.gradle.kts` - Application module configuration
- `gradle.properties` - Gradle properties and JVM settings
- `app/proguard-rules.pro` - ProGuard/R8 optimization rules

### Source Code
- `app/src/main/java/com/cmwen/minandroidtemplate/` - Main application code
- `app/src/main/res/` - Application resources (layouts, strings, drawables)
- `app/src/main/AndroidManifest.xml` - Application manifest

### CI/CD Configuration
- `.github/workflows/build.yml` - Main build workflow
- `.github/workflows/release.yml` - Release build workflow
- `.github/workflows/beta.yml` - Beta build workflow
- `.github/workflows/codeql.yml` - Security scanning workflow
- `.github/dependabot.yml` - Dependency update automation

### Development Environment
- `.devcontainer/devcontainer.json` - VS Code dev container configuration
- `.gitignore` - Git ignore rules for Android projects

## Build Commands

### Basic Commands
```bash
# Build the app
./gradlew build

# Run unit tests
./gradlew test

# Clean build artifacts
./gradlew clean

# Assemble debug APK
./gradlew assembleDebug

# Assemble release APK
./gradlew assembleRelease

# Assemble beta APK
./gradlew assembleBeta

# Create release bundle (for Play Store)
./gradlew bundleRelease
```

### Dependency Management
```bash
# Check for dependency updates
./gradlew dependencyUpdates

# View dependency tree
./gradlew app:dependencies
```

### Code Quality
```bash
# Run lint checks
./gradlew lint

# Run tests with coverage
./gradlew test jacocoTestReport
```

## Workflows

### Build Workflow
- **Trigger**: Push or PR to main/develop branches
- **Actions**: Build app, run tests, upload artifacts
- **Artifacts**: Debug and release APKs/bundles (7 days retention)

### Release Workflow
- **Trigger**: Tag push (v*) or manual dispatch
- **Actions**: 
  - Creates keystore (self-signed if secrets not provided)
  - Builds signed release APK and bundle
  - Creates GitHub release with artifacts
- **Artifacts**: Release APK and bundle (30 days retention)

### Beta Workflow
- **Trigger**: Push to beta/develop branches or manual dispatch
- **Actions**: Build beta variant with .beta app ID suffix
- **Artifacts**: Beta APK (14 days retention)

### CodeQL Workflow
- **Trigger**: Push/PR to main/develop, weekly schedule
- **Actions**: Static code analysis for security vulnerabilities
- **Languages**: Java/Kotlin

## Dependabot Configuration

Dependabot is configured to automatically create PRs for dependency updates with intelligent grouping:

### Update Groups
1. **androidx**: All AndroidX libraries
2. **kotlin**: Kotlin language and standard library
3. **testing**: JUnit, Espresso, and test frameworks
4. **google**: Google/Material Design components
5. **build-tools**: AGP and Gradle wrapper
6. **github-actions**: GitHub Actions versions

### Schedule
- Updates run weekly on Mondays
- Maximum 5 open PRs at a time per ecosystem

## Signing Configuration

### For CI/CD
Set these repository secrets:
- `KEYSTORE_BASE64`: Base64-encoded keystore file
- `KEYSTORE_PASSWORD`: Keystore password
- `KEY_ALIAS`: Key alias name
- `KEY_PASSWORD`: Key password

### Local Development
Export environment variables:
```bash
export KEYSTORE_FILE=/path/to/keystore.jks
export KEYSTORE_PASSWORD=your_password
export KEY_ALIAS=your_alias
export KEY_PASSWORD=your_key_password
```

## Code Modification Guidelines

### When Adding Features
1. Follow existing code structure and naming conventions
2. Use View Binding for UI components
3. Add resources to appropriate directories under `res/`
4. Update strings.xml for user-facing text
5. Maintain target SDK 34 compatibility

### When Updating Dependencies
1. Check compatibility with target SDK 34
2. Test build after updates
3. Review changelog for breaking changes
4. Update version numbers in build.gradle.kts

### When Modifying Build Configuration
1. Use Kotlin DSL syntax
2. Keep configuration centralized where possible
3. Test with `./gradlew build --dry-run` first
4. Verify both debug and release builds work

## Testing Guidelines

### Unit Tests
- Location: `app/src/test/`
- Framework: JUnit 4
- Run with: `./gradlew test`

### Instrumented Tests
- Location: `app/src/androidTest/`
- Frameworks: AndroidX Test, Espresso
- Require Android emulator or device

## Common Tasks for Agents

### Adding a New Dependency
1. Add to `app/build.gradle.kts` in dependencies block
2. Sync Gradle
3. Verify build succeeds
4. Update README if it's a major dependency

### Creating a New Screen
1. Create Kotlin class extending AppCompatActivity
2. Create layout XML in `res/layout/`
3. Add activity to AndroidManifest.xml
4. Wire up with View Binding

### Updating SDK Version
1. Update `compileSdk` and `targetSdk` in `app/build.gradle.kts`
2. Test for deprecated API usage
3. Update AndroidX dependencies if needed
4. Update README

### Adding a New Build Variant
1. Define in `buildTypes` in `app/build.gradle.kts`
2. Create signing config if needed
3. Add workflow if CI/CD support needed
4. Document in README

## Troubleshooting

### Build Failures
1. Check `./gradlew build --stacktrace` for details
2. Verify JDK 17 is being used
3. Try `./gradlew clean build`
4. Check for dependency conflicts with `./gradlew app:dependencies`

### Workflow Failures
1. Check workflow logs in GitHub Actions
2. Verify secrets are set correctly for signing
3. Ensure workflow YAML syntax is valid
4. Test locally with similar commands

## Best Practices

1. **Keep it minimal**: This is a template, avoid adding unnecessary features
2. **Stay current**: Use latest stable versions of Android SDK, AGP, and Gradle
3. **Document changes**: Update README and AGENTS.md when making significant changes
4. **Test thoroughly**: Run all build variants and tests before committing
5. **Security first**: Never commit keystore files or secrets
6. **Follow conventions**: Maintain consistent code style and structure

## Resources

- [Android Developer Documentation](https://developer.android.com/docs)
- [Gradle Documentation](https://docs.gradle.org/)
- [Kotlin Documentation](https://kotlinlang.org/docs/)
- [GitHub Actions Documentation](https://docs.github.com/actions)
- [Material Design Guidelines](https://material.io/design)

## Agent Behavior Notes

- Always check that changes maintain compatibility with SDK 34
- Verify build succeeds before committing changes
- Use provided Gradle wrapper, don't modify wrapper version without good reason
- Keep dependencies up to date but stable (avoid alpha/beta versions)
- Maintain existing code style and structure
- Test both debug and release builds after modifications
