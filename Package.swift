// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "SideMenu",
	platforms: [
		.macOS(.v12),
		.iOS(.v15),
		.watchOS(.v8)
	],
	products: [
		.library(name: "SideMenu", targets: ["SideMenu"])
	],
	targets: [
		.target(name: "SideMenu")
	]
)
