import SwiftUI

struct SettingsView: View {

    @Binding var selectedColorScheme: Int
    @Binding var selectedTemperatureUnit: Int
    @Binding var useCurrentLocation: Bool
    @Binding var selectedLocation: Int

    let cities: [String]

    var body: some View {
        Form {
            GeneralSettingsView(selectedColorScheme: $selectedColorScheme,
                    selectedTemperatureUnit: $selectedTemperatureUnit)
            LocationSettingsView(useCurrentLocation: $useCurrentLocation,
                    selectedLocation: $selectedLocation,
                    cities: cities)
        }
                .navigationTitle("Settings")
    }
}

struct SectionHeaderTextView: View {

    let text: String

    var body: some View {
        Text(text)
                .padding(.leading, -20)
    }
}

struct GeneralSettingsView: View {

    @Binding var selectedColorScheme: Int
    @Binding var selectedTemperatureUnit: Int

    var body: some View {
        Section(header: SectionHeaderTextView(text: "General settings")) {
            Picker("Appearance", selection: $selectedColorScheme) {
                Text("Automatic").tag(0)
                Text("Light mode").tag(1)
                Text("Dark mode").tag(2)
            }
            Picker("Temperature unit", selection: $selectedTemperatureUnit) {
                Text("Celsius (°C)").tag(0)
                Text("Fahrenheit (°F)").tag(1)
                Text("Kelvin (°K)").tag(2)
            }
        }
    }
}

struct LocationSettingsView: View {

    @Binding var useCurrentLocation: Bool
    @Binding var selectedLocation: Int

    let cities: [String]

    var body: some View {
        Section(header: SectionHeaderTextView(text: "Location")) {
            Toggle("Use current location", isOn: $useCurrentLocation)
            if (!useCurrentLocation) {
                Picker("Location", selection: $selectedLocation) {
                    ForEach(cities.indices, id: \.self) { index in
                        Text(cities[index]).tag(index)
                    }
                }
            }
        }
    }
}