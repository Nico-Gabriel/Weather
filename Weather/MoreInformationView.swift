import SwiftUI

struct MoreInformationView: View {

    @Binding var showMoreInformationView: Bool

    let lightMode: Bool

    @State var showAboutThisAppView = false

    var body: some View {
        VStack {
            TabView {
                AppearanceDescriptionView()
                TemperatureUnitDescriptionView(lightMode: lightMode)
                CurrentLocationDescriptionView()
            }
                    .tabViewStyle(.page)
                    .padding(.bottom, -9)
            OkButtonView(showMoreInformationView: $showMoreInformationView)
            AboutThisAppButtonView(showAboutThisAppView: $showAboutThisAppView)
        }
                .sheet(isPresented: $showAboutThisAppView) {
                    AboutThisAppView(showAboutThisAppView: $showAboutThisAppView)
                }
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = lightMode ? .darkGray : .lightGray
                    UIPageControl.appearance().pageIndicatorTintColor = lightMode ? .lightGray : .darkGray
                }
    }
}

struct AppearanceDescriptionView: View {

    var body: some View {
        VStack {
            Text("Appearance")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .padding(.top, 68)
                    .padding(.bottom, -10)
            Text("Choose between a light and a dark appearance, or pick the automatic mode " +
                    "which sets a style for you depending on the position of the sun.")
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .padding(.trailing)
            Image(systemName: "sparkles")
                    .font(.system(size: 70))
                    .padding()
                    .padding(.bottom, 8)
            HStack {
                AppearancePreviewView(lightMode: true)
                AppearancePreviewView(lightMode: false)
            }
            Spacer()
        }
    }
}

struct AppearancePreviewView: View {

    let lightMode: Bool

    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: lightMode ? [lightblue, lightpink] : [darkgray, lightgray]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                Image(systemName: lightMode ? "sun.max.fill" : "moon.fill")
                        .renderingMode(.original)
                        .font(.system(size: 50))
            }
                    .frame(width: 135, height: 240)
                    .cornerRadius(24)
            Text(lightMode ? "light mode" : "dark mode")
        }
                .padding(lightMode ? .trailing : .leading)
    }
}

struct TemperatureUnitDescriptionView: View {

    let lightMode: Bool

    var body: some View {
        VStack {
            Text("Temperature unit")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .padding(.top, 68)
                    .padding(.bottom, -10)
            Text("Select the unit in which the temperature should be displayed. You can choose " +
                    "between degrees Celsius, degrees Fahrenheit and degrees Kelvin.")
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .padding(.trailing)
            Image(systemName: "thermometer.medium")
                    .font(.system(size: 70))
                    .padding()
                    .padding(.bottom, 10)
            HStack {
                TemperatureUnitPreviewView(lightMode: lightMode, temperatureUnit: "Celsius", temperature: 27)
                TemperatureUnitPreviewView(lightMode: lightMode, temperatureUnit: "Fahrenheit", temperature: 81)
                        .padding(.horizontal)
                TemperatureUnitPreviewView(lightMode: lightMode, temperatureUnit: "Kelvin", temperature: 300)
            }
            Spacer()
        }
    }
}

struct TemperatureUnitPreviewView: View {

    let lightMode: Bool
    let temperatureUnit: String
    let temperature: Int

    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: lightMode ? [lightblue, lightpink] : [darkgray, lightgray]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                VStack {
                    Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .font(.system(size: 40))
                            .padding(.top, 8)
                    Text("\(temperature)°")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .medium))
                            .padding(.top, 4)
                }
            }
                    .frame(width: 100, height: 120)
                    .cornerRadius(24)
            Text(temperatureUnit)
            Text("°" + temperatureUnit.prefix(1))
        }
    }
}

struct CurrentLocationDescriptionView: View {

    var body: some View {
        VStack {
            Text("Current location")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .padding(.top, 68)
                    .padding(.bottom, -10)
            Text("Description for the current location...")
            Image(systemName: "location.fill")
                    .font(.system(size: 70))
                    .padding()
            Spacer()
        }
    }
}

struct OkButtonView: View {

    @Binding var showMoreInformationView: Bool

    var body: some View {
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
                .padding(.bottom, 10)
    }
}

struct AboutThisAppButtonView: View {

    @Binding var showAboutThisAppView: Bool

    var body: some View {
        Button {
            showAboutThisAppView = true
        } label: {
            Text("About this app")
                    .font(.system(size: 18, weight: .semibold))
        }
                .padding(.bottom, 15)
    }
}