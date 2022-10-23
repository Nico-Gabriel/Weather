import SwiftUI

struct DetailedWeatherView: View {

    @Binding var weather: Weather
    @Binding var showDetailedWeatherView: Bool

    let lightMode: Bool

    var body: some View {
        ZStack {
            BackgroundView(lightMode: lightMode)
            ScrollView {
                ExitButtonView(showDetailedWeatherView: $showDetailedWeatherView, lightMode: lightMode)
                Text(weather.weekday)
            }
        }
    }
}

struct ExitButtonView: View {

    @Binding var showDetailedWeatherView: Bool

    let lightMode: Bool

    var body: some View {
        Button {
            showDetailedWeatherView = false
        } label: {
            Image(systemName: "xmark.app.fill")
                    .font(.system(size: 50))
                    .foregroundColor(lightMode ? .black : .white)
        }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.top, 4)
                .padding()
    }
}