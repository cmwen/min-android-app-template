#!/usr/bin/env bash
set -euo pipefail

# This script downloads the Gradle wrapper files without requiring a local Gradle installation.
# It uses the official Gradle wrapper JAR and configures it for the version defined below.

GRADLE_VERSION="${GRADLE_VERSION:-8.7}"
WRAPPER_DIR="gradle/wrapper"

mkdir -p "${WRAPPER_DIR}"

if [[ ! -f "${WRAPPER_DIR}/gradle-wrapper.jar" ]]; then
  echo "Downloading Gradle wrapper ${GRADLE_VERSION}..."
  ZIP_PATH="/tmp/gradle-${GRADLE_VERSION}-bin.zip"
  curl -fL "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
    -o "${ZIP_PATH}"

  JAR_ENTRY="gradle-${GRADLE_VERSION}/lib/plugins/gradle-wrapper-${GRADLE_VERSION}.jar"
  if ! unzip -l "${ZIP_PATH}" "${JAR_ENTRY}" >/dev/null 2>&1; then
    echo "Unable to locate ${JAR_ENTRY} in distribution zip." >&2
    exit 1
  fi

  unzip -p "${ZIP_PATH}" "${JAR_ENTRY}" > "${WRAPPER_DIR}/gradle-wrapper.jar"
  rm -f "${ZIP_PATH}"
else
  echo "Gradle wrapper jar already exists."
fi

cat > "${WRAPPER_DIR}/gradle-wrapper.properties" <<EOF
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\\://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
networkTimeout=10000
validateDistributionUrl=true
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
EOF

cat > gradlew <<'EOF'
#!/usr/bin/env sh

#
# Copyright 2015 the original authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        JAVA_CMD="$JAVA_HOME/jre/sh/java"
    else
        JAVA_CMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVA_CMD" ] ; then
        echo "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME" >&2
        exit 1
    fi
else
    JAVA_CMD="java"
fi

# Increase the maximum file descriptors if we can.
if [ "$OSTYPE" = "cygwin" ] || [ "$OSTYPE" = "msys" ] || [ "$OSTYPE" = "darwin"* ]; then
    ulimit -n 2048 >/dev/null 2>&1 || true
fi

CLASSPATH=$(dirname "$0")/gradle/wrapper/gradle-wrapper.jar
APP_BASE_NAME=$(basename "$0")

exec "$JAVA_CMD" -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
EOF

chmod +x gradlew

cat > gradlew.bat <<'EOF'
@echo off
@rem ##############################################################
@rem
@rem  Gradle startup script for Windows
@rem
@rem ##############################################################

setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.

set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

"%JAVA_EXE%" -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*

:end
endlocal
exit /b 0

:fail
endlocal
exit /b 1
EOF

echo "Gradle wrapper configured for version ${GRADLE_VERSION}."
