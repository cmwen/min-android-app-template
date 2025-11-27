#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# Quick Start Script for min-android-app-template
# =============================================================================
# This script helps you customize the template for your new app in minutes.
# It will:
#   1. Ask for your app name and package name
#   2. Update all necessary files
#   3. Run flutter pub get to verify the setup
#   4. Optionally run the analyzer to check for issues
#
# Usage: ./scripts/setup/quick-start.sh
# =============================================================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
DEFAULT_APP_NAME="my_awesome_app"
DEFAULT_PACKAGE_NAME="com.example.my_awesome_app"
DEFAULT_APP_DISPLAY_NAME="My Awesome App"

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║                                                                   ║"
echo "║             🚀 Welcome to Quick Start Setup! 🚀                  ║"
echo "║                                                                   ║"
echo "║   This script will help you customize your new Flutter app.      ║"
echo "║                                                                   ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Get script directory and navigate to project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$PROJECT_ROOT"

echo -e "${YELLOW}📁 Working in: $PROJECT_ROOT${NC}\n"

# Function to validate app name (must be lowercase, underscores, no spaces)
validate_app_name() {
    local name=$1
    if [[ ! "$name" =~ ^[a-z][a-z0-9_]*$ ]]; then
        echo -e "${RED}❌ Invalid app name. Must start with lowercase letter and contain only lowercase letters, numbers, and underscores.${NC}"
        return 1
    fi
    return 0
}

# Function to validate package name
validate_package_name() {
    local name=$1
    if [[ ! "$name" =~ ^[a-z][a-z0-9]*(\.[a-z][a-z0-9_]*)+$ ]]; then
        echo -e "${RED}❌ Invalid package name. Must be in format: com.company.appname${NC}"
        return 1
    fi
    return 0
}

# Prompt for app name
while true; do
    echo -e "${GREEN}📝 Enter your app name (lowercase, underscores OK):${NC}"
    echo -e "   Example: my_shopping_list, todo_app, notes_manager"
    read -p "   App name [$DEFAULT_APP_NAME]: " APP_NAME
    APP_NAME="${APP_NAME:-$DEFAULT_APP_NAME}"
    
    if validate_app_name "$APP_NAME"; then
        break
    fi
done

# Prompt for display name
echo -e "\n${GREEN}📝 Enter your app display name (shown to users):${NC}"
echo -e "   Example: My Shopping List, Todo App, Notes Manager"
read -p "   Display name [$DEFAULT_APP_DISPLAY_NAME]: " APP_DISPLAY_NAME
APP_DISPLAY_NAME="${APP_DISPLAY_NAME:-$DEFAULT_APP_DISPLAY_NAME}"

# Prompt for package name
while true; do
    echo -e "\n${GREEN}📝 Enter your package name (reverse domain format):${NC}"
    echo -e "   Example: com.yourcompany.$APP_NAME"
    DEFAULT_SUGGESTED_PACKAGE="com.example.$APP_NAME"
    read -p "   Package name [$DEFAULT_SUGGESTED_PACKAGE]: " PACKAGE_NAME
    PACKAGE_NAME="${PACKAGE_NAME:-$DEFAULT_SUGGESTED_PACKAGE}"
    
    if validate_package_name "$PACKAGE_NAME"; then
        break
    fi
done

echo -e "\n${BLUE}═══════════════════════════════════════════════════════════════════${NC}"
echo -e "${YELLOW}📋 Summary of changes:${NC}"
echo -e "   App Name:      ${GREEN}$APP_NAME${NC}"
echo -e "   Display Name:  ${GREEN}$APP_DISPLAY_NAME${NC}"
echo -e "   Package Name:  ${GREEN}$PACKAGE_NAME${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════════════${NC}"

read -p "Proceed with these changes? [Y/n]: " CONFIRM
CONFIRM="${CONFIRM:-Y}"
if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Cancelled. No changes made.${NC}"
    exit 0
fi

echo -e "\n${YELLOW}🔄 Updating files...${NC}\n"

# 1. Update pubspec.yaml
echo -e "   ${BLUE}[1/5]${NC} Updating pubspec.yaml..."
sed -i "s/^name: min_flutter_template/name: $APP_NAME/" pubspec.yaml
sed -i "s/description: \"A minimal Android Flutter application template - escape Android dependency hell!\"/description: \"$APP_DISPLAY_NAME - Built with min-android-app-template\"/" pubspec.yaml
echo -e "   ${GREEN}✓${NC} pubspec.yaml updated"

# 2. Update lib/main.dart
echo -e "   ${BLUE}[2/5]${NC} Updating lib/main.dart..."
sed -i "s/title: 'My App'/title: '$APP_DISPLAY_NAME'/" lib/main.dart
echo -e "   ${GREEN}✓${NC} lib/main.dart updated"

# 3. Update test/widget_test.dart
echo -e "   ${BLUE}[3/5]${NC} Updating test/widget_test.dart..."
sed -i "s/import 'package:min_flutter_template\/main.dart';/import 'package:$APP_NAME\/main.dart';/" test/widget_test.dart
echo -e "   ${GREEN}✓${NC} test/widget_test.dart updated"

# 4. Update android/app/build.gradle.kts
echo -e "   ${BLUE}[4/5]${NC} Updating android/app/build.gradle.kts..."
sed -i "s/namespace = \"com.cmwen.min_flutter_template\"/namespace = \"$PACKAGE_NAME\"/" android/app/build.gradle.kts
sed -i "s/applicationId = \"com.cmwen.min_flutter_template\"/applicationId = \"$PACKAGE_NAME\"/" android/app/build.gradle.kts
echo -e "   ${GREEN}✓${NC} android/app/build.gradle.kts updated"

# 5. Update android/app/src/main/AndroidManifest.xml
echo -e "   ${BLUE}[5/5]${NC} Updating AndroidManifest.xml..."
sed -i "s/android:label=\"min_flutter_template\"/android:label=\"$APP_DISPLAY_NAME\"/" android/app/src/main/AndroidManifest.xml
echo -e "   ${GREEN}✓${NC} AndroidManifest.xml updated"

echo -e "\n${GREEN}✅ All files updated successfully!${NC}\n"

# Check if Flutter is available
if command -v flutter &> /dev/null; then
    echo -e "${YELLOW}🔄 Running flutter pub get...${NC}"
    flutter pub get
    
    read -p "Would you like to run flutter analyze to check for issues? [Y/n]: " RUN_ANALYZE
    RUN_ANALYZE="${RUN_ANALYZE:-Y}"
    if [[ "$RUN_ANALYZE" =~ ^[Yy]$ ]]; then
        echo -e "\n${YELLOW}🔍 Running flutter analyze...${NC}"
        flutter analyze || true
    fi
else
    echo -e "${YELLOW}⚠️  Flutter not found in PATH. Please run 'flutter pub get' manually.${NC}"
fi

echo -e "\n${GREEN}"
echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║                                                                   ║"
echo "║                    🎉 Setup Complete! 🎉                          ║"
echo "║                                                                   ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${BLUE}Next steps:${NC}"
echo -e "  1. Run ${YELLOW}flutter run${NC} to test your app"
echo -e "  2. Customize the theme in ${YELLOW}lib/main.dart${NC}"
echo -e "  3. Start building your features!"
echo ""
echo -e "For more help, see:"
echo -e "  📚 ${YELLOW}GETTING_STARTED.md${NC} - Complete setup guide"
echo -e "  🎨 ${YELLOW}APP_CUSTOMIZATION.md${NC} - Customization checklist"
echo -e "  🤖 ${YELLOW}docs/AI_BEGINNER_GUIDE.md${NC} - AI-assisted development"
echo ""
echo -e "${GREEN}Happy coding! 🚀${NC}"
