import SwiftUI

let lightblue = Color(red: 0.36, green: 0.7, blue: 1)
let lightpink = Color(red: 0.9, green: 0.8, blue: 0.9)
let lightgray = Color(red: 0.7, green: 0.7, blue: 0.7)
let darkgray = Color(red: 0.15, green: 0.15, blue: 0.15)

let deviceWidth = CGFloat(UIScreen.main.bounds.width)
let deviceHeight = CGFloat(UIScreen.main.bounds.height)

struct ContentView: View {

    // this dummy data will be replaced by data from a weather api
    let location = "Vienna, AT"
    let weatherForecasts = [Weather(weekday: "MONDAY", icon: "cloud.sun.fill", temperature: 27),
                            Weather(weekday: "TUESDAY", icon: "cloud.sun.fill", temperature: 28),
                            Weather(weekday: "WEDNESDAY", icon: "sun.max.fill", temperature: 32),
                            Weather(weekday: "THURSDAY", icon: "sun.max.fill", temperature: 31),
                            Weather(weekday: "FRIDAY", icon: "cloud.rain.fill", temperature: 24),
                            Weather(weekday: "SATURDAY", icon: "wind", temperature: 23),
                            Weather(weekday: "SUNDAY", icon: "cloud.fill", temperature: 25)]

    @State var weatherForDetailedView = Weather(weekday: "---", icon: "---", temperature: 0)
    @State var showDetailedWeatherView = false
    @State var selectedColorScheme = 0
    @State var selectedTemperatureUnit = 0

    let version = "1.0.0"

    var body: some View {
        NavigationView {
            let lightMode = (selectedColorScheme == 0 && isSunUp()) || selectedColorScheme == 1
            ZStack {
                BackgroundView(lightMode: lightMode)
                VStack {
                    LocationView(location: location)
                    Spacer()
                    WeatherStatusView(weatherForDetailedView: $weatherForDetailedView,
                            showDetailedWeatherView: $showDetailedWeatherView,
                            currentWeather: weatherForecasts[0])
                    Spacer()
                    WeatherForecast(weatherForDetailedView: $weatherForDetailedView,
                            showDetailedWeatherView: $showDetailedWeatherView,
                            weathers: [weatherForecasts[1], weatherForecasts[2], weatherForecasts[3]])
                    Spacer()
                    WeatherForecast(weatherForDetailedView: $weatherForDetailedView,
                            showDetailedWeatherView: $showDetailedWeatherView,
                            weathers: [weatherForecasts[4], weatherForecasts[5], weatherForecasts[6]])
                    Spacer()
                    SettingsButtonView(selectedColorScheme: $selectedColorScheme,
                            selectedTemperatureUnit: $selectedTemperatureUnit,
                            lightMode: lightMode,
                            version: version)
                }
            }
                    .sheet(isPresented: $showDetailedWeatherView) {
                        DetailedWeatherView(showDetailedWeatherView: $showDetailedWeatherView,
                                weather: $weatherForDetailedView,
                                lightMode: lightMode,
                                location: location)
                    }
                    .preferredColorScheme(lightMode ? .light : .dark)
        }
    }

    func isSunUp() -> Bool {
        true
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

struct LocationView: View {

    let location: String

    var body: some View {
        HStack {
            Text(location)
                    .font(.system(size: 32, weight: .medium, design: .default))
            Image(systemName: "location.fill")
                    .font(.system(size: 24))
        }
                .foregroundColor(.white)
                .padding(.top, 30)
    }
}

struct WeatherStatusView: View {

    @Binding var weatherForDetailedView: Weather
    @Binding var showDetailedWeatherView: Bool

    let currentWeather: Weather

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: currentWeather.icon)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: (deviceWidth / 100) * 50, height: (deviceHeight / 100) * 20)
            Text("\(currentWeather.temperature)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
        }
                .onTapGesture {
                    weatherForDetailedView = currentWeather
                    showDetailedWeatherView = true
                }
    }
}

struct WeatherDayView: View {

    @Binding var weatherForDetailedView: Weather
    @Binding var showDetailedWeatherView: Bool

    let weather: Weather

    var body: some View {
        VStack {
            Text(weather.weekday.prefix(3))
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
            Image(systemName: weather.icon)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            Text("\(weather.temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
        }
                .onTapGesture {
                    weatherForDetailedView = weather
                    showDetailedWeatherView = true
                }
    }
}

struct WeatherForecast: View {

    @Binding var weatherForDetailedView: Weather
    @Binding var showDetailedWeatherView: Bool

    let weathers: [Weather]

    var body: some View {
        HStack(spacing: 54) {
            WeatherDayView(weatherForDetailedView: $weatherForDetailedView,
                    showDetailedWeatherView: $showDetailedWeatherView,
                    weather: weathers[0])
            WeatherDayView(weatherForDetailedView: $weatherForDetailedView,
                    showDetailedWeatherView: $showDetailedWeatherView,
                    weather: weathers[1])
            WeatherDayView(weatherForDetailedView: $weatherForDetailedView,
                    showDetailedWeatherView: $showDetailedWeatherView,
                    weather: weathers[2])
        }
    }
}

struct SettingsButtonView: View {

    @Binding var selectedColorScheme: Int
    @Binding var selectedTemperatureUnit: Int

    let lightMode: Bool
    let version: String

    var body: some View {
        NavigationLink(destination: SettingsView(selectedColorScheme: $selectedColorScheme,
                selectedTemperatureUnit: $selectedTemperatureUnit,
                version: version)) {
            Text("Settings")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .frame(width: deviceWidth - 120, height: 50)
                    .foregroundColor(lightMode ? lightblue : .white)
                    .background(lightMode ? .white : lightgray)
                    .cornerRadius(10)
        }
                .padding(.bottom, 20)
    }
}