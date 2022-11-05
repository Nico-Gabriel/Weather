import SwiftUI

struct AboutThisAppView: View {

    @Binding var showAboutThisAppView: Bool

    var body: some View {
        NavigationView {
            ScrollView {
                Text("abc123...")
            }
                    .navigationTitle("About this app")
                    .toolbar {
                        ToolbarItem {
                            Button("Close") {
                                showAboutThisAppView = false
                            }
                        }
                    }
        }
    }
}