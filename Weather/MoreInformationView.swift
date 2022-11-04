import SwiftUI

struct MoreInformationView: View {

    var body: some View {
        VStack {
            Text("More information")
                    .font(.title)
                    .padding(50)
            Text("Information comes here")
                    .padding(50)
            Button("Dismiss") {
                print("dismiss pressed")
            }
        }
    }
}