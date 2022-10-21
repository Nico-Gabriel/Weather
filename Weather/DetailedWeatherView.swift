import SwiftUI

struct DetailedWeatherView: View {

    @Binding var showDetailedWeatherView: Bool

    let lightMode: Bool

    var body: some View {
        VStack {
            Button {
                showDetailedWeatherView = false
            } label: {
                Image(systemName: "xmark.app.fill")
                        .font(.system(size: 50))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .foregroundColor(lightMode ? .black : .white)
                        .padding(.top, 4)
                        .padding()
            }
        }
    }
}