//
//  ContentView.swift
//  weather-app
//
//  Created by Marek on 2023/10/07.
//

import SwiftUI

struct WeekView: View {
    @State private var isDarkMode: Bool = true
    @State private var cityName: String = ""
    
    // Optional because data will be filled after success call
    @State var currentWeather: Weather?

    
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
                Text("Week TAB")
                if (currentWeather == nil) {
                    EmptyCityPlaceholder()
                } else {
                    WeatherCard(cityName: currentWeather?.name ?? "",
                                icon: "cloud.sun.fill",
                                tempValue: currentWeather?.main.temp ?? 0.0)
                }
                Spacer()
                WeatherSearchBar(cityName: $cityName, currentWeather: $currentWeather)
            }
        }
    }
}
