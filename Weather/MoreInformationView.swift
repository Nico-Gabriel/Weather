import SwiftUI

struct MoreInformationView: View {

    @Binding var showMoreInformationView: Bool

    @State var showAboutThisAppView = false

    var body: some View {
        VStack {
            Text("More information")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .padding(.top, 60)
            Text("Information comes here")
            Spacer()
            TabView {
                Text("1")
                Text("2")
                Text("3")
            }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
            Button {
                showMoreInformationView = false
            } label: {
                Text("OK")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: deviceWidth - 88, height: 50)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(15)
            }
                    .padding(.bottom)
            Button {
                showAboutThisAppView = true
            } label: {
                Text("About this app")
                        .font(.system(size: 18, weight: .semibold))
            }
                    .padding(.bottom, 15)
        }
                .sheet(isPresented: $showAboutThisAppView) {
                    AboutThisAppView(showAboutThisAppView: $showAboutThisAppView)
                }
    }
}