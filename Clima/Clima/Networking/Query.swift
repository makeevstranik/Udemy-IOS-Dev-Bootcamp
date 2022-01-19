//
//  Query.swift
//  Clima
//
//  Created by Евгений Макеев on 19.01.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

struct Query {
    private let url: String
    private let appid: String
    private let units: String
    private var city: String?
    private var lat: CLLocationDegrees?
    private var lon: CLLocationDegrees?
    
    private init() {
        url = "https://api.openweathermap.org/data/2.5/weather"
        appid = "appid=ec770c7664ea610a580e4f9e9996d175"
        units = "units=metric"
    }
    
    init(city: String) {
        self.init()
        self.city = city
    }
    init(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        self.init()
        self.lat = lat
        self.lon = lon
    }
    var getURL: String {
        return url
    }
    var getQuery: String {
        if let cityName = self.city {
            return "\(appid)&\(units)&q=\(cityName)"
        } else {
            return "\(appid)&\(units)&lat=\(lat!)&lon=\(lon!)"
        }
    }
}


