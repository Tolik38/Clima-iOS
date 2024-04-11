//
//  WeatherData.swift
//  Clima
//
//  Created by Gustavo Mendonca on 11/04/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable{
    let name : String
    let main: Main
    let weather: [Weather]
    let clouds: Clouds

}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable{
    let description: String
    let id: Int
}

struct Clouds: Codable{
    let all: Int
}



