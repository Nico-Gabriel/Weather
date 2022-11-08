import SwiftUI

struct SettingsView: View {

    @Binding var selectedColorScheme: Int
    @Binding var selectedTemperatureUnit: Int

    @State var showMoreInformationView = false

    let lightMode: Bool
    let version: String

    var body: some View {
        Form {
            AppearanceSettingsView(selectedColorScheme: $selectedColorScheme)
            TemperatureUnitSettingsView(selectedTemperatureUnit: $selectedTemperatureUnit)
            LocationInformationView()
            AboutInformationView(showMoreInformationView: $showMoreInformationView, version: version)
        }
                .navigationTitle("Settings")
                .sheet(isPresented: $showMoreInformationView) {
                    MoreInformationView(showMoreInformationView: $showMoreInformationView, lightMode: lightMode)
                }
    }
}

struct AppearanceSettingsView: View {

    @Binding var selectedColorScheme: Int

    var body: some View {
        Section(header: Text("Appearance"), footer: Text("abc123...")) {
            Picker("Appearance", selection: $selectedColorScheme) {
                Text("Automatic").tag(0)
                Text("Light mode").tag(1)
                Text("Dark mode").tag(2)
            }
        }
    }
}

struct TemperatureUnitSettingsView: View {

    @Binding var selectedTemperatureUnit: Int

    var body: some View {
        Section(header: Text("Temperature unit"), footer: Text("abc123...")) {
            Picker("Temperature unit", selection: $selectedTemperatureUnit) {
                Text("Celsius (°C)").tag(0)
                Text("Fahrenheit (°F)").tag(1)
                Text("Kelvin (°K)").tag(2)
            }
        }
    }
}

struct LocationInformationView: View {

    var body: some View {
        Section(header: Text("Location"), footer: Text("abc123...")) {
            Text("Current location")
        }
    }
}

struct AboutInformationView: View {

    @Binding var showMoreInformationView: Bool

    let version: String

    var body: some View {
        Section(header: Text("About")) {
            HStack {
                Text("Version")
                Spacer()
                Text(version)
            }
            Button{
                showMoreInformationView = true
            } label: {
                Text("More information")
            }
        }
    }
}