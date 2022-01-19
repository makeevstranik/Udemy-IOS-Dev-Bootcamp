//
//  WeatherConditions.swift
//  Clima
//
//  Created by Евгений Макеев on 17.01.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

enum WeatherConditions: String {
    case thunderstorm = "cloud.bolt.rain.fill"
    case drizzle = "cloud.drizzle.fill"
    case rain = "cloud.rain.fill"
    case snow = "cloud.snow.fill"
    case atmosphere = "cloud.fog.fill"
    case clear = "sun.max.fill"
    case clouds = "cloud.fill"
    case unknown = "exclamationmark.icloud"
}
