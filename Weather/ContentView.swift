import SwiftUI

let lightblue = Color(red: 0.36, green: 0.7, blue: 1)
let lightpink = Color(red: 0.9, green: 0.8, blue: 0.9)
let lightgray = Color(red: 0.7, green: 0.7, blue: 0.7)
let darkgray = Color(red: 0.15, green: 0.15, blue: 0.15)

let deviceWidth = CGFloat(UIScreen.main.bounds.width)
let deviceHeight = CGFloat(UIScreen.main.bounds.height)

struct ContentView: View {

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        let lightMode = colorScheme == .light
        ZStack {
            BackgroundView(lightMode: lightMode)
            VStack {
                Spacer()
                SettingsButton(textColor: lightMode ? lightblue : .white,
                        backgroundColor: lightMode ? .white : lightgray)
            }
        }
    }
}

struct BackgroundView: View {

    let lightMode: Bool

    var body: some View {
        let colors = lightMode ? [lightblue, lightpink] : [darkgray, lightgray]
        LinearGradient(gradient: Gradient(colors: colors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
    }
}

struct SettingsButton: View {

    var textColor: Color
    var backgroundColor: Color

    var body: some View {
        NavigationLink("Settings", destination: SettingsView())
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: deviceWidth - 120, height: 50)
                .foregroundColor(textColor)
                .background(backgroundColor)
                .cornerRadius(10)
                .padding(.bottom, 30)
    }
}