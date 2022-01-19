//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Евгений Макеев on 18.01.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weather: WeatherModel)
    func didFailWithError(_ error: String)
}
