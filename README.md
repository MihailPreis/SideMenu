# SideMenu

<p>
    <img src="https://img.shields.io/badge/iOS-15.0+-blue.svg" />
    <img src="https://img.shields.io/badge/watchOS-8.0+-blue.svg" />
    <img src="https://img.shields.io/badge/macOS-12.0+-blue.svg" />
    <img src="https://img.shields.io/badge/Swift-5.6-ff69b4.svg" />
</p>

Small side menu implementation for SwiftUI.

## How to use?

```swift
import SwiftUI

struct ContentView: View {
    @State var showSideMenu = false

    var body: some View {
        NavigationView {
            // ...
            Button("Open SideMenu") {
                showSideMenu = true
            }
            // ...
        }
        .sideMenu(isShow: $showSidebar) {
            Color.red
                .ignoresSafeArea()
                .frame(width: 200)
        }
    }
}
```
