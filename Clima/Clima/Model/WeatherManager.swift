//
//  WeatherManager.swift
//  Clima
//
//  Created by Евгений Макеев on 15.01.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherManager {
    var queryService = QueryService()
    var delegate: WeatherManagerDelegate?
    
    private func fetchWeather(_ query: Query) {
        
        queryService.getSearchResults(query: query, completionHandler: { [weak self] weather, error in
            if let weatherParsedData = weather {
                self?.delegate?.didUpdateWeather(WeatherModel(weatherData: weatherParsedData))
            }
            if !error.isEmpty {
                self?.delegate?.didFailWithError(error)
            }
        })
    }
}
extension WeatherManager {
    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        self.fetchWeather(Query(lat: lat, lon: lon))
    }
    func fetchWeather(cityName: String) {
        self.fetchWeather(Query(city: cityName))
    }
}
