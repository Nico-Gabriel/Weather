import SwiftUI

let lightblue = Color(red: 0.36, green: 0.7, blue: 1)
let lightpink = Color(red: 0.9, green: 0.8, blue: 0.9)
let lightgray = Color(red: 0.7, green: 0.7, blue: 0.7)
let darkgray = Color(red: 0.15, green: 0.15, blue: 0.15)

let deviceWidth = CGFloat(UIScreen.main.bounds.width)
let deviceHeight = CGFloat(UIScreen.main.bounds.height)

struct ContentView: View {

    let location = "Vienna, AT"
    let days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
    let images = ["cloud.sun.fill", "cloud.sun.fill", "sun.max.fill", "sun.max.fill",
                  "cloud.rain.fill", "wind", "cloud.fill"]
    let temperatures = [27, 28, 32, 31, 24, 23, 25]

    @State var showDetailedWeatherView = false
    @State var selectedColorScheme = 0
    @State var selectedTemperatureUnit = 0
    @State var useCurrentLocation = true
    @State var selectedLocation = 0

    let cities = ["City 1", "City 2", "City 3"]
    let colorScheme: ColorScheme

    var body: some View {
        let lightMode = (colorScheme == .light && selectedColorScheme == 0) || selectedColorScheme == 1
        ZStack {
            BackgroundView(lightMode: lightMode)
            VStack {
                LocationTextView(location: location)
                Spacer()
                WeatherStatusView(imageName: images[0], temperature: temperatures[0])
                        .onTapGesture {
                            showDetailedWeatherView = true
                        }
                Spacer()
                WeatherForecast(showDetailedWeatherView: $showDetailedWeatherView,
                        days: [days[1], days[2], days[3]],
                        images: [images[1], images[2], images[3]],
                        temperatures: [temperatures[1], temperatures[2], temperatures[3]])
                Spacer()
                WeatherForecast(showDetailedWeatherView: $showDetailedWeatherView,
                        days: [days[4], days[5], days[6]],
                        images: [images[4], images[5], images[6]],
                        temperatures: [temperatures[4], temperatures[5], temperatures[6]])
                Spacer()
                SettingsButtonView(selectedColorScheme: $selectedColorScheme,
                        selectedTemperatureUnit: $selectedTemperatureUnit,
                        useCurrentLocation: $useCurrentLocation,
                        selectedLocation: $selectedLocation,
                        cities: cities,
                        lightMode: lightMode)
            }
        }
                .sheet(isPresented: $showDetailedWeatherView) {
                    DetailedWeatherView(showDetailedWeatherView: $showDetailedWeatherView, lightMode: lightMode)
                }
                .preferredColorScheme(lightMode ? .light : .dark)
    }
}

struct BackgroundView: View {

    let lightMode: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: lightMode ? [lightblue, lightpink] : [darkgray, lightgray]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
    }
}

struct LocationTextView: View {

    let location: String

    var body: some View {
        Text(location)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding(.top, 30)
    }
}

struct WeatherStatusView: View {

    let imageName: String
    let temperature: Int

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: (deviceWidth / 100) * 50, height: (deviceHeight / 100) * 20)
            Text("\(temperature)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
        }
    }
}

struct WeatherDayView: View {

    @Binding var showDetailedWeatherView: Bool

    let dayOfWeek: String
    let imageName: String
    let temperature: Int

    var body: some View {
        VStack {
            Text(dayOfWeek)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
            Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
        }
                .onTapGesture {
                    showDetailedWeatherView = true
                }
    }
}

struct WeatherForecast: View {

    @Binding var showDetailedWeatherView: Bool

    let days: [String]
    let images: [String]
    let temperatures: [Int]

    var body: some View {
        HStack(spacing: 54) {
            WeatherDayView(showDetailedWeatherView: $showDetailedWeatherView,
                    dayOfWeek: days[0],
                    imageName: images[0],
                    temperature: temperatures[0])
            WeatherDayView(showDetailedWeatherView: $showDetailedWeatherView,
                    dayOfWeek: days[1],
                    imageName: images[1],
                    temperature: temperatures[1])
            WeatherDayView(showDetailedWeatherView: $showDetailedWeatherView,
                    dayOfWeek: days[2],
                    imageName: images[2],
                    temperature: temperatures[2])
        }
    }
}

struct SettingsButtonView: View {

    @Binding var selectedColorScheme: Int
    @Binding var selectedTemperatureUnit: Int
    @Binding var useCurrentLocation: Bool
    @Binding var selectedLocation: Int

    let cities: [String]
    let lightMode: Bool

    var body: some View {
        NavigationLink("Settings", destination: SettingsView(selectedColorScheme: $selectedColorScheme,
                selectedTemperatureUnit: $selectedTemperatureUnit,
                useCurrentLocation: $useCurrentLocation,
                selectedLocation: $selectedLocation,
                cities: cities))
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: deviceWidth - 120, height: 50)
                .foregroundColor(lightMode ? lightblue : .white)
                .background(lightMode ? .white : lightgray)
                .cornerRadius(10)
                .padding(.bottom, 20)
    }
}