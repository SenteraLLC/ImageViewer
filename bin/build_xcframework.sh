#!/bin/bash
set -e

SCHEME="ImageViewer"
FRAMEWORK_NAME="ImageViewer"
CONFIGURATION="Release"

echo "=== Building $FRAMEWORK_NAME XCFramework ==="

# Clean
rm -rf build
mkdir -p build

# Archive for device
xcodebuild archive \
  -project ImageViewer.xcodeproj \
  -scheme "$SCHEME" \
  -configuration "$CONFIGURATION" \
  -destination "generic/platform=iOS" \
  -archivePath "build/$FRAMEWORK_NAME-ios.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Archive for simulator
xcodebuild archive \
  -project ImageViewer.xcodeproj \
  -scheme "$SCHEME" \
  -configuration "$CONFIGURATION" \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "build/$FRAMEWORK_NAME-iossimulator.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
xcodebuild -create-xcframework \
  -framework "build/$FRAMEWORK_NAME-ios.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -framework "build/$FRAMEWORK_NAME-iossimulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -output "build/$FRAMEWORK_NAME.xcframework"

open ./build

echo ""
echo ":white_check_mark: Done! XCFramework is at: build/$FRAMEWORK_NAME.xcframework"
echo "You can now copy it into your main project or commit it."
