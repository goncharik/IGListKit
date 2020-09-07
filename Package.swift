// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "IGListKit",
    platforms: [.iOS(.v9), .macOS(.v10_11), .tvOS(.v9)],
    products: [
        .library(name: "IGListKit", targets: ["IGListDiffKit", "IGListKit"])
    ],
    targets: [
        .binaryTarget(
            name: "IGListDiffKit",
            path: "artifacts/IGListDiffKit.xcframework"
        ),
        .binaryTarget(
            name: "IGListKit",
            path: "artifacts/IGListKit.xcframework"
        )
    ]
)
