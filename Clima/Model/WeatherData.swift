//
//  WeatherData.swift
//  Clima
//
//  Created by Gustavo Mendonca on 11/04/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name : String
    let main: Main
    let weather: [Weather]
    let clouds: Clouds

}

struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let description: String
}

struct Clouds: Decodable{
    let all: Int
}


