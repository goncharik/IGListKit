#!/bin/bash

# --------------------
# Delete old artifacts
# --------------------

# IGListDiffKit

rm -rf './artifacts/IGListDiffKit.xcframework'

# IGListKit

rm -rf './artifacts/IGListKit.xcframework'

# ----------------------------------
# Build Platform specific frameworks
# ----------------------------------

# iOS device

xcodebuild archive \
    -workspace 'IGListKit.xcworkspace' \
    -scheme 'IGListKit' \
    -configuration Release \
    -sdk iphoneos \
    -archivePath './artifacts/IGListKit.framework-iphoneos.xcarchive' \
    SKIP_INSTALL=NO \
    | xcpretty

# iOS simulator

xcodebuild archive \
    -workspace 'IGListKit.xcworkspace' \
    -scheme 'IGListKit' \
    -configuration Release \
    -sdk iphonesimulator \
    -archivePath './artifacts/IGListKit.framework-iphonesimulator.xcarchive' \
    SKIP_INSTALL=NO \
    | xcpretty

# tvOS device

xcodebuild archive \
    -workspace 'IGListKit.xcworkspace' \
    -scheme 'IGListKit-tvOS' \
    -configuration Release \
    -sdk appletvos \
    -archivePath './artifacts/IGListKit.framework-appletvos.xcarchive' \
    SKIP_INSTALL=NO \
    | xcpretty

# tvOS simulator

xcodebuild archive \
    -workspace 'IGListKit.xcworkspace' \
    -scheme 'IGListKit-tvOS' \
    -configuration Release \
    -sdk appletvsimulator \
    -archivePath './artifacts/IGListKit.framework-appletvsimulator.xcarchive' \
    SKIP_INSTALL=NO \
    | xcpretty

# macOS

xcodebuild archive \
    -workspace 'IGListKit.xcworkspace' \
    -scheme 'IGListKit-macOS' \
    -configuration Release \
    -archivePath './artifacts/IGListKit.framework-macos.xcarchive' \
    SKIP_INSTALL=NO \
    | xcpretty

# -------------------
# Package xcframework
# -------------------

# IGListDiffKit

xcodebuild -create-xcframework \
    -framework './artifacts/IGListKit.framework-iphoneos.xcarchive/Products/Library/Frameworks/IGListDiffKit.framework' \
    -framework './artifacts/IGListKit.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/IGListDiffKit.framework' \
    -framework './artifacts/IGListKit.framework-appletvos.xcarchive/Products/Library/Frameworks/IGListDiffKit.framework' \
    -framework './artifacts/IGListKit.framework-appletvsimulator.xcarchive/Products/Library/Frameworks/IGListDiffKit.framework' \
    -framework './artifacts/IGListKit.framework-macos.xcarchive/Products/Library/Frameworks/IGListDiffKit.framework' \
    -output './artifacts/IGListDiffKit.xcframework'

# IGListKit

xcodebuild -create-xcframework \
    -framework './artifacts/IGListKit.framework-iphoneos.xcarchive/Products/Library/Frameworks/IGListKit.framework' \
    -framework './artifacts/IGListKit.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/IGListKit.framework' \
    -framework './artifacts/IGListKit.framework-appletvos.xcarchive/Products/Library/Frameworks/IGListKit.framework' \
    -framework './artifacts/IGListKit.framework-appletvsimulator.xcarchive/Products/Library/Frameworks/IGListKit.framework' \
    -framework './artifacts/IGListKit.framework-macos.xcarchive/Products/Library/Frameworks/IGListKit.framework' \
    -output './artifacts/IGListKit.xcframework' 
