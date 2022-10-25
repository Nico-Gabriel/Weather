import SwiftUI

struct DetailedWeatherView: View {

    @Binding var showDetailedWeatherView: Bool
    @Binding var weather: Weather

    let lightMode: Bool
    let location: String

    var body: some View {
        ZStack {
            BackgroundView(lightMode: lightMode)
            ScrollView {
                ExitButtonView(showDetailedWeatherView: $showDetailedWeatherView)
                Text(location)
                        .foregroundColor(.white)
                Text(weather.weekday)
                        .foregroundColor(.white)
            }
        }
    }
}

struct ExitButtonView: View {

    @Binding var showDetailedWeatherView: Bool

    var body: some View {
        Button {
            showDetailedWeatherView = false
        } label: {
            Image(systemName: "xmark.app.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
        }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.top, 4)
                .padding()
    }
}