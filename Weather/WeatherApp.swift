import SwiftUI

@main
struct WeatherApp: App {

    @Environment(\.colorScheme) var colorScheme

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(colorScheme: colorScheme)
            }
        }
    }
}