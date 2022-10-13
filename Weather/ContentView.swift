import SwiftUI

let lightblue = Color(red: 0.36, green: 0.7, blue: 1)
let lightpink = Color(red: 0.9, green: 0.8, blue: 0.9)
let lightgray = Color(red: 0.7, green: 0.7, blue: 0.7)
let darkgray = Color(red: 0.15, green: 0.15, blue: 0.15)

let deviceWidth = CGFloat(UIScreen.main.bounds.width)
let deviceHeight = CGFloat(UIScreen.main.bounds.height)

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme

    @State var selectedColorScheme = 0

    var body: some View {
        let lightMode = (colorScheme == .light && selectedColorScheme == 0) || selectedColorScheme == 1
        ZStack {
            BackgroundView(lightMode: lightMode)
            VStack {
                Spacer()
                SettingsButtonView(selectedColorScheme: $selectedColorScheme, lightMode: lightMode)
            }
        }
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

struct SettingsButtonView: View {

    @Binding var selectedColorScheme: Int

    let lightMode: Bool

    var body: some View {
        NavigationLink("Settings", destination: SettingsView(selectedColorScheme: $selectedColorScheme, lightMode: lightMode))
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: deviceWidth - 120, height: 50)
                .foregroundColor(lightMode ? lightblue : .white)
                .background(lightMode ? .white : lightgray)
                .cornerRadius(10)
                .padding(.bottom, 30)
    }
}