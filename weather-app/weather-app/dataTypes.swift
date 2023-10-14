//
//  dataTypes.swift
//  weather-app
//
//  Created by Marek on 2023/10/14.
//

import Foundation

// Weather response type
struct weather: Codable {
    let id: Int
    let main: String
    let description: String
}

struct main: Codable {
    let temp: Double
    // response key is in snake_case, but in Swift we use camelCase
    // so we will need to use decoder with property ".convertFromSnakeCase"
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Codable {
    let weather: Array<weather>
    let main: main
    let name: String
    let dt: Int
}
