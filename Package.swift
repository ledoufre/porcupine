// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "porcupine",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "porcupine",
            targets: ["porcupine"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/ledoufre/ios-voice-processor.git", .branch("feat-spm-support")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "porcupine",
            dependencies: ["ios-voice-processor", "PvPorcupine"],
            path: "binding/ios",
            exclude: ["Porcupine-iOS.podspec", "README.md"],
            resources: [.process("../../resources"), .process("../../lib/common/porcupine_params.pv")]),
        .binaryTarget(
            name: "PvPorcupine",
            path: "lib/ios/PvPorcupine.xcframework"
        )
    ]
)
