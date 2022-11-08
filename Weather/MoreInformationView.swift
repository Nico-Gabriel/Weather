import SwiftUI

struct MoreInformationView: View {

    @Binding var showMoreInformationView: Bool

    let lightMode: Bool

    @State var showAboutThisAppView = false

    var body: some View {
        VStack {
            TabView {
                AppearanceDescriptionView()
                TemperatureUnitDescriptionView()
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
            Text("Description for the appearance...")
            Spacer()
        }
    }
}

struct TemperatureUnitDescriptionView: View {

    var body: some View {
        VStack {
            Text("Temperature unit")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .padding(.top, 68)
                    .padding(.bottom, -10)
            Text("Description for the temperature unit...")
            Spacer()
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