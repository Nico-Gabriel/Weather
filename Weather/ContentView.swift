import SwiftUI

let lightblue = Color(red: 0.36, green: 0.7, blue: 1)
let lightpink = Color(red: 0.9, green: 0.8, blue: 0.9)
let lightgray = Color(red: 0.7, green: 0.7, blue: 0.7)
let darkgray = Color(red: 0.15, green: 0.15, blue: 0.15)

let deviceWidth = CGFloat(UIScreen.main.bounds.width)
let deviceHeight = CGFloat(UIScreen.main.bounds.height)

struct ContentView: View {

    @State var selectedColorScheme = 0
    @State var selectedTemperatureUnit = 0
    @State var useCurrentLocation = true
    @State var selectedLocation = 0

    let cities = ["City 1", "City 2", "City 3"]
    let colorScheme: ColorScheme

    var body: some View {
        let lightMode = (colorScheme == .light && selectedColorScheme == 0) || selectedColorScheme == 1
        ZStack {
            BackgroundView(lightMode: lightMode)
            VStack {
                Spacer()
                SettingsButtonView(selectedColorScheme: $selectedColorScheme,
                        selectedTemperatureUnit: $selectedTemperatureUnit,
                        useCurrentLocation: $useCurrentLocation,
                        selectedLocation: $selectedLocation,
                        cities: cities,
                        lightMode: lightMode)
            }
        }
                .preferredColorScheme(lightMode ? .light : .dark)
    }
}

struct BackgroundView: View {

    let lightMode: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: lightMode ? [lightblue, lightpink] : [darkgray, lightgray]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
    }
}

struct SettingsButtonView: View {

    @Binding var selectedColorScheme: Int
    @Binding var selectedTemperatureUnit: Int
    @Binding var useCurrentLocation: Bool
    @Binding var selectedLocation: Int

    let cities: [String]
    let lightMode: Bool

    var body: some View {
        NavigationLink("Settings", destination: SettingsView(selectedColorScheme: $selectedColorScheme,
                selectedTemperatureUnit: $selectedTemperatureUnit,
                useCurrentLocation: $useCurrentLocation,
                selectedLocation: $selectedLocation,
                cities: cities))
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: deviceWidth - 120, height: 50)
                .foregroundColor(lightMode ? lightblue : .white)
                .background(lightMode ? .white : lightgray)
                .cornerRadius(10)
                .padding(.bottom, 20)
    }
}