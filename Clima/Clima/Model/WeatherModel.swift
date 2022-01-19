//
//  WeatherModel.swift
//  Clima
//
//  Created by Евгений Макеев on 17.01.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    var weatherData: WeatherData
    
    var conditionId: Int {
        return (weatherData.weather[0].id)
    }
    var cityName: String {
        return (weatherData.name)
    }
    var temp: Double {
        return (weatherData.main["temp"])!
    }
    var tempString: String {
        return String(format: "%.1f", self.temp)
    }
    var conditions: String {
        var condition: WeatherConditions
        switch self.conditionId {
            case 200...232: condition = .thunderstorm
            case 300...321: condition = .drizzle
            case 500...531: condition = .rain
            case 600...622: condition = .snow
            case 701...781: condition = .atmosphere
            case 800: condition = .clear
            case 801...804: condition = .clouds
            default: condition = .unknown
        }
        return condition.rawValue
    }
}
