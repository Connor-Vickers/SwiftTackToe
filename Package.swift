import PackageDescription

let package = Package(
  targets: [
    Target(name: "TTT"),
    Target(name: "Main", dependencies: [.Target(name: "TTT")]),
    Target(name: "Specs", dependencies: [.Target(name: "TTT")])
  ],
  dependencies: [
    .Package(url: "https://github.com/bppr/Speck.git", Version(0,0,2))
  ]
)
