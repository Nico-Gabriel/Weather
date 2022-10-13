import SwiftUI

let lightblueTest = Color(red: 0.36, green: 0.7, blue: 1)
let lightpinkTest = Color(red: 0.9, green: 0.8, blue: 0.9)
let lightgrayTest = Color(red: 0.7, green: 0.7, blue: 0.7)
let darkgrayTest = Color(red: 0.15, green: 0.15, blue: 0.15)

struct ContentViewTest: View {

    @State private var isNight = false

    var body: some View {
        ZStack {
            BackgroundViewTest(isNight: $isNight)
            VStack {
                CityTextViewTest(cityName: "Vienna, AUT")
                Spacer()
                WeatherStatusViewTest(isNight: $isNight, temperature: 27)
                Spacer()
                UpperWeatherForecastTest()
                LowerWeatherForecastTest()
                ToggleDayAndNightButtonTest(isNight: $isNight)
            }
        }
    }
}

struct BackgroundViewTest: View {

    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? darkgray : lightblue, isNight ? .gray : lightpink]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextViewTest: View {

    var cityName: String

    var body: some View {
        Text(cityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding(.top, 44)
    }
}

struct WeatherStatusViewTest: View {

    @Binding var isNight: Bool

    var temperature: Int

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
            Text("\(temperature)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
        }
                .frame(width: 180, height: 280)
    }
}

struct WeatherDayViewTest: View {

    var dayOfWeek: String
    var imageName: String
    var temperature: Int

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
    }
}

struct UpperWeatherForecastTest: View {
    var body: some View {
        HStack(spacing: 54) {
            WeatherDayViewTest(dayOfWeek: "TUE",
                    imageName: "cloud.sun.fill",
                    temperature: 28)
            WeatherDayViewTest(dayOfWeek: "WED",
                    imageName: "sun.max.fill",
                    temperature: 32)
            WeatherDayViewTest(dayOfWeek: "THU",
                    imageName: "sun.max.fill",
                    temperature: 31)
        }
                .padding(.bottom, 42)
    }
}

struct LowerWeatherForecastTest: View {
    var body: some View {
        HStack(spacing: 54) {
            WeatherDayViewTest(dayOfWeek: "FRI",
                    imageName: "cloud.rain.fill",
                    temperature: 24)
            WeatherDayViewTest(dayOfWeek: "SAT",
                    imageName: "wind",
                    temperature: 23)
            WeatherDayViewTest(dayOfWeek: "SUN",
                    imageName: "cloud.fill",
                    temperature: 25)
        }
                .padding(.bottom, 42)
    }
}

struct ToggleDayAndNightButtonTest: View {

    @Binding var isNight: Bool

    var body: some View {
        Button {
            isNight.toggle()
        } label: {
            ButtonViewTest(title: isNight ? "Switch to day" : "Switch to night",
                    textColor: isNight ? .white : lightblue,
                    backgroundColor: isNight ? lightgray : .white)
        }
                .padding(.bottom, 44)
    }
}

struct ButtonViewTest: View {

    var title: String
    var textColor: Color
    var backgroundColor: Color

    var body: some View {
        Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(textColor)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .cornerRadius(10)
    }
}

struct SettingsViewalt: View {

    @Binding var showSettings: Bool

    let lightMode: Bool

    var body: some View {
        VStack {
            Button {
                showSettings = false
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