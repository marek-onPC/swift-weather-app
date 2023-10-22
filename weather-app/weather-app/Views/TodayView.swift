//
//  ContentView.swift
//  weather-app
//
//  Created by Marek on 2023/10/07.
//

import SwiftUI

struct TodayView: View {
    @Binding var cityName: String
    @Binding var currentWeather: Weather?
    @Binding var hourlyWeather: ThreeHourWeather?
    @State private var isDarkMode: Bool = true

    func setIsDay() -> Void {
        isDarkMode.toggle()
    }
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: Color("lightBlue"),
                           bottomColorLight: .blue,
                           bottomColorDark: .black,
                           isLight: isDarkMode)
            
            VStack {
                Text("Today TAB")
                if (currentWeather == nil) {
                    EmptyCityPlaceholder()
                } else {
                    WeatherCard(cityName: currentWeather?.name ?? "",
                                icon: "cloud.sun.fill",
                                tempValue: currentWeather?.main.temp ?? 0.0)
                }
                Spacer()
                WeatherSearchBar(cityName: $cityName, currentWeather: $currentWeather, hourlyWeather: $hourlyWeather)
            }
        }
    }
}
