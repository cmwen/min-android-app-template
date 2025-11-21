# Testing the Template

This document provides guidance on how to test this Android app template.

## Environment Requirements

To successfully build and test this template, you need:

1. **JDK 17** or higher installed
2. **Android SDK** with API level 34 installed
3. **Network Access** to:
   - maven.google.com (for Android dependencies)
   - repo1.maven.org (for Maven Central)
   - plugins.gradle.org (for Gradle plugins)

## Local Testing

### First-Time Setup

1. Clone the repository:
```bash
git clone https://github.com/cmwen/cmwen-min-android-app-template.git
cd cmwen-min-android-app-template
```

2. Make gradlew executable (Linux/Mac):
```bash
chmod +x gradlew
```

3. Build the project:
```bash
./gradlew build
```

### Expected Build Output

On the first build, Gradle will:
1. Download Gradle wrapper if needed
2. Download Android SDK build tools and libraries
3. Download dependencies (AndroidX, Material Components, etc.)
4. Compile the Kotlin code
5. Generate build artifacts

Successful build should show:
```
BUILD SUCCESSFUL in Xs
```

### Build Variants

Test all build variants:

```bash
# Debug build
./gradlew assembleDebug

# Release build (unsigned)
./gradlew assembleRelease

# Beta build
./gradlew assembleBeta

# All variants
./gradlew assemble
```

### Running Tests

```bash
# Unit tests
./gradlew test

# Check lint
./gradlew lint

# All checks
./gradlew check
```

## Testing CI/CD Workflows

### GitHub Actions

The workflows will automatically trigger on:

1. **Build Workflow** - On push/PR to main or develop branches
2. **Release Workflow** - On tag push (v*) or manual dispatch
3. **Beta Workflow** - On push to beta/develop branches
4. **CodeQL Workflow** - On push/PR to main/develop, or weekly

### Testing Locally with act

You can test GitHub Actions workflows locally using [act](https://github.com/nektos/act):

```bash
# Install act (macOS)
brew install act

# Test build workflow
act -j build

# Test with secrets
act -j release --secret-file .secrets
```

## Common Issues

### Issue: Build fails with "Could not resolve"

**Cause**: Network connectivity to maven.google.com or dependency repositories

**Solution**: 
- Check internet connection
- Verify firewall/proxy settings
- Try building again (transient network issues)

### Issue: "SDK location not found"

**Cause**: Android SDK not installed or ANDROID_HOME not set

**Solution**:
```bash
# Linux/Mac
export ANDROID_HOME=$HOME/Android/Sdk

# Windows
set ANDROID_HOME=C:\Users\YourUsername\AppData\Local\Android\Sdk
```

Or create `local.properties` in project root:
```properties
sdk.dir=/path/to/android/sdk
```

### Issue: Java version mismatch

**Cause**: Wrong Java version

**Solution**:
```bash
# Check Java version
java -version

# Should show Java 17 or higher
# If not, install JDK 17 and set JAVA_HOME
```

### Issue: Gradle daemon issues

**Cause**: Corrupted Gradle cache

**Solution**:
```bash
# Stop all Gradle daemons
./gradlew --stop

# Clean and rebuild
./gradlew clean build
```

## Testing in Different Environments

### Development Container

Test using the included devcontainer:

1. Open in VS Code with Remote - Containers extension
2. Choose "Reopen in Container"
3. Run `./gradlew build` in the integrated terminal

### CI Environment

The GitHub Actions workflows test in:
- Ubuntu latest with JDK 17
- Automated dependency caching
- Parallel job execution

### Local Android Studio

1. Open Android Studio
2. Open the project directory
3. Wait for Gradle sync
4. Build → Make Project
5. Run tests from IDE

## Verification Checklist

Before committing changes or creating a release, verify:

- [ ] `./gradlew clean build` succeeds
- [ ] `./gradlew test` passes all tests
- [ ] `./gradlew lint` shows no critical issues
- [ ] All build variants compile successfully
- [ ] App installs and runs on emulator/device
- [ ] No security vulnerabilities in dependencies
- [ ] GitHub Actions workflows pass
- [ ] Documentation is up to date

## Performance Benchmarks

Expected build times on reasonable hardware:

- **Clean build**: 1-3 minutes
- **Incremental build**: 10-30 seconds
- **Test execution**: 5-15 seconds

## Debugging Build Issues

Enable verbose logging:

```bash
# With stacktrace
./gradlew build --stacktrace

# With full debug info
./gradlew build --debug > build.log 2>&1

# Scan build performance
./gradlew build --scan
```

## Additional Resources

- [Gradle Documentation](https://docs.gradle.org/)
- [Android Gradle Plugin Release Notes](https://developer.android.com/build/releases/gradle-plugin)
- [GitHub Actions Documentation](https://docs.github.com/actions)
- [Troubleshooting Builds](https://developer.android.com/studio/troubleshoot)
