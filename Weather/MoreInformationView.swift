import SwiftUI

struct MoreInformationView: View {

    @Binding var showMoreInformationView: Bool

    var body: some View {
        VStack {
            Text("More information")
                    .font(.largeTitle)
                    .bold()
                    .padding()
            Text("Information comes here")
            Spacer()
            Button {
                showMoreInformationView = false
            } label: {
                Text("Bildschirmzeit aktivieren")
                        .font(.system(size: 17, weight: .semibold, design: .default))
                        .frame(width: deviceWidth - 88, height: 50)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(17)
            }
                    .padding(.bottom, 20)
        }
    }
}