import PackageDescription

let package = Package(
  targets: [
    Target(name: "Core"),
    Target(name: "Specs", dependencies: [.Target(name: "Core")])
  ],
  dependencies: [
    .Package(url: "https://github.com/hkgumbs/XTest.git", Version(0,1,8))
  ]
)
