#!/bin/bash

# --------------------
# Delete old artifacts
# --------------------

rm -rf './artifacts/ECDSALib.xcframework'

# ----------------------------------
# Build Platform specific frameworks
# ----------------------------------

# iOS device

xcodebuild archive \
    -project 'ECDSALib.xcodeproj' \
    -scheme 'ECDSALib' \
    -configuration Release \
    -sdk iphoneos \
    -archivePath './artifacts/ECDSALib.framework-iphoneos.xcarchive' \
    SKIP_INSTALL=NO \
    | xcpretty

# iOS simulator

xcodebuild archive \
    -project 'ECDSALib.xcodeproj' \
    -scheme 'ECDSALib' \
    -configuration Release \
    -sdk iphonesimulator \
    -archivePath './artifacts/ECDSALib.framework-iphonesimulator.xcarchive' \
    SKIP_INSTALL=NO \
    | xcpretty

# tvOS device

# xcodebuild archive \
#     -project 'ECDSALib.xcodeproj' \
#     -scheme 'ECDSALib' \
#     -configuration Release \
#     -sdk appletvos \
#     -archivePath './artifacts/IGListKit.framework-appletvos.xcarchive' \
#     SKIP_INSTALL=NO \
#     | xcpretty

# tvOS simulator

# xcodebuild archive \
#     -project 'ECDSALib.xcodeproj' \
#     -scheme 'ECDSALib' \
#     -configuration Release \
#     -sdk appletvsimulator \
#     -archivePath './artifacts/IGListKit.framework-appletvsimulator.xcarchive' \
#     SKIP_INSTALL=NO \
#     | xcpretty

# macOS

# xcodebuild archive \
#     -project 'ECDSALib.xcodeproj' \
#     -scheme 'ECDSALib' \
#     -configuration Release \
#     -archivePath './artifacts/IGListKit.framework-macos.xcarchive' \
#     SKIP_INSTALL=NO \
#     | xcpretty

# macOS (Catalyst)

#xcodebuild archive \
#    -project 'ECDSALib.xcodeproj' \
#    -scheme 'ECDSALib' \
#    -configuration Release \
#    -destination 'platform=macOS,arch=x86_64,variant=Mac Catalyst'
#    -archivePath './artifacts/ECDSALib.framework-catalyst.xcarchive' \
#    SKIP_INSTALL=NO \
#    | xcpretty

# -------------------
# Package xcframework
# -------------------

xcodebuild -create-xcframework \
    -framework './artifacts/ECDSALib.framework-iphoneos.xcarchive/Products/Library/Frameworks/ECDSALib.framework' \
    -framework './artifacts/ECDSALib.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/ECDSALib.framework' \
    -output './artifacts/ECDSALib.xcframework'
