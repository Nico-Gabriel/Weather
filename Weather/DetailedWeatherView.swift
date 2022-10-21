import SwiftUI

struct DetailedWeatherView: View {

    @Binding var showDetailedWeatherView: Bool
    @Binding var dayForDetailedWeatherView: String

    let lightMode: Bool

    var body: some View {
        ScrollView {
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
            Text(dayForDetailedWeatherView)
        }
    }
}