// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OrganizeImports",
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Files", .exact("4.0.0"))
    ],
    targets: [
        .target(
            name: "OrganizeImports",
            dependencies: ["Files"]),
        .testTarget(
            name: "OrganizeImportsTests",
            dependencies: ["OrganizeImports"]),
    ]
)
