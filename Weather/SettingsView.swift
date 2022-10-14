import SwiftUI

struct SettingsView: View {

    @Binding var selectedColorScheme: Int

    @State var useLocation = true

    var body: some View {
        Form {
            Section(header: SectionHeaderTextView(text: "General settings")) {
                Picker("Appearance", selection: $selectedColorScheme) {
                    Text("System default").tag(0)
                    Text("Light mode").tag(1)
                    Text("Dark mode").tag(2)
                }
            }
            Section(header: SectionHeaderTextView(text: "Location")) {
                Toggle("Use current location", isOn: $useLocation)
            }
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