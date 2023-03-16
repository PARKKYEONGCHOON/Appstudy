//
//  WeatherInfo.swift
//  Weather
//
//  Created by 박경춘 on 2023/03/16.
//

import Foundation

struct WeatherInformation: Codable {
    let weather: [Wheather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey{
        case weather
        case temp = "main"
        case name
    }
}

struct Wheather: Codable {
    let id:Int
    let main: String
    let description: String
    let icon: String
}

struct Temp: Codable {
    let temp: Double
    let feels_like: Double
    let lowTemp: Double
    let highTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feels_like = "feels_like"
        case lowTemp = "temp_min"
        case highTemp = "temp_max"
    }
}


