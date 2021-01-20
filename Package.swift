// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Unrealm",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_12)
    ],
    products: [
        .library(name: "UnrealmObjC", targets: ["UnrealmObjC"]),
        .library(name: "Unrealm", targets: ["Unrealm", "UnrealmObjC"])
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-cocoa.git", from: "10.5.0"),
        .package(url: "https://github.com/arturdev/RuntimeNew.git", from: "2.1.7")
    ],
    targets: [
        .target(
            name: "UnrealmObjC",
            dependencies: ["Realm", "RealmSwift"],
            path: "Unrealm/Classes/ObjC"
        ),
        .target(
            name: "Unrealm",
            dependencies: ["UnrealmObjC", "Realm", "RealmSwift", "RuntimeNew"],
            path: "Unrealm/Classes/Swift"
        )
    ],
    swiftLanguageVersions: [.v5]
)
