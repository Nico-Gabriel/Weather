import SwiftUI

struct SettingsView: View {

    @State var selectedFlavor = 3

    var body: some View {
        VStack {
            Form {
                List {
                    Picker("Flavor", selection: $selectedFlavor) {
                        Text("Chocolate").tag(1)
                        Text("Vanilla").tag(2)
                        Text("Strawberry").tag(3)
                    }
                }
            }
        }
                .navigationTitle("Settings")
    }
}