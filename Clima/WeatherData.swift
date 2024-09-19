//
//  WeatherData.swift
//  Clima
//
//  Created by Gustavo Mendonca on 19/09/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name: String // bring the country's name
    let weather:[Weather] // description from the place | weather is inside of a list
    let main: Main // temperature from the place
    
}

struct Weather: Decodable{
    let id: Int
    let description: String
}

struct Main: Decodable{
    let temp: Double
}
