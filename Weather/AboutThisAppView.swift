import SwiftUI

struct AboutThisAppView: View {

    @Binding var showAboutThisAppView: Bool

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack (alignment: .leading) {
                    Text("Weather")
                            .font(.largeTitle)
                            .bold()
                }
                        .padding()
                Divider()
                        .padding()
                LazyVStack (alignment: .leading) {
                    Text("Subheadline")
                            .font(.title)
                            .fontWeight(.semibold)
                    Text("Text 1...")
                    Text("Text 2...")
                    Text("Text 3...")
                    Text("Text 4...")
                    Text("Text 5...")
                    Text("Text 6...")
                    Text("Text 7...")
                    Text("Text 8...")
                    Text("Text 9...")
                }
                        .padding()
                Divider()
                        .padding()
                LazyVStack (alignment: .leading) {
                    Text("Subheadline")
                            .font(.title)
                            .fontWeight(.semibold)
                    Text("Text 1...")
                    Text("Text 2...")
                    Text("Text 3...")
                    Text("Text 4...")
                    Text("Text 5...")
                    Text("Text 6...")
                    Text("Text 7...")
                    Text("Text 8...")
                    Text("Text 9...")
                }
                        .padding()
                Divider()
                        .padding()
                LazyVStack (alignment: .leading) {
                    Text("Subheadline")
                            .font(.title)
                            .fontWeight(.semibold)
                    Text("Text 1...")
                    Text("Text 2...")
                    Text("Text 3...")
                    Text("Text 4...")
                    Text("Text 5...")
                    Text("Text 6...")
                    Text("Text 7...")
                    Text("Text 8...")
                    Text("Text 9...")
                }
                        .padding()
                Divider()
                        .padding()
                LazyVStack (alignment: .leading) {
                    Text("Developer")
                            .font(.title)
                            .fontWeight(.semibold)
                    Text("Text 1...")
                    Text("Text 2...")
                    Text("Text 3...")
                    Text("Text 4...")
                    Text("Text 5...")
                    Text("Text 6...")
                    Text("Text 7...")
                    Text("Text 8...")
                    Text("Text 9...")
                }
                        .padding()
            }
                    .navigationBarTitle("About this app", displayMode: .inline)
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