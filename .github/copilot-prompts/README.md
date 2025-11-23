# Copilot Custom Prompts

This directory contains custom prompt files that guide GitHub Copilot and other LLMs to follow project-specific best practices and constraints.

## How to Use Custom Prompts

Custom prompts are automatically loaded by VS Code when you have the Copilot extension installed. They help guide Copilot's responses to be more aligned with your project's requirements.

For more information, see: https://code.visualstudio.com/docs/copilot/customization/prompt-files

## Available Prompts

### android-dependency-compatibility.md

**Purpose**: Ensures all Android dependency additions and updates maintain compatibility with the project's build configuration.

**Key Guidelines**:
- Validates against SDK requirements (minSdk 24, targetSdk 36)
- Checks Kotlin version compatibility (2.2.21)
- Verifies AGP and Gradle compatibility (8.13.1 / 9.2.1)
- Ensures JDK 17 compatibility
- Provides a checklist for local build validation
- Includes common issues and solutions

**When to Use**:
- Adding new dependencies to `app/build.gradle.kts`
- Updating existing dependency versions
- Troubleshooting build failures related to dependencies
- Reviewing dependency compatibility during code reviews

## Contributing Custom Prompts

When adding new custom prompts:

1. Create a descriptive filename ending in `.md`
2. Include clear context about the project
3. Provide specific rules and constraints
4. Add validation checklists where applicable
5. Include troubleshooting guidance
6. Link to relevant documentation

## Project Dependencies Reference

Current build configuration:
- **Kotlin**: 2.2.21
- **AGP**: 8.13.1
- **Gradle**: 9.2.1
- **JDK**: 17
- **Target SDK**: 36
- **Minimum SDK**: 24

For the latest dependency versions, check `app/build.gradle.kts` and `build.gradle.kts`.
