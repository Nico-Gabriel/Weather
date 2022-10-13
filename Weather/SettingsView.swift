import SwiftUI

struct SettingsView: View {

    @Binding var selectedColorScheme: Int

    var body: some View {
        Form {
            List {
                Picker("Appearance", selection: $selectedColorScheme) {
                    Text("System default").tag(0)
                    Text("Light mode").tag(1)
                    Text("Dark mode").tag(2)
                }
            }
        }
                .navigationTitle("Settings")
    }
}