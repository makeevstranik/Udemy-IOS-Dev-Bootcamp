//
//  QueryService.swift
//  Clima
//
//  Created by Евгений Макеев on 18.01.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class QueryService {
    private var weatherParsedData: WeatherData?
    private let defaultSession = URLSession(configuration: .default)
    private var error: String = ""
    private var task: URLSessionDataTask?
    
    func getSearchResults(query: Query, completionHandler: @escaping (WeatherData?, String) -> Void) {
        error = ""
        if var urlComponents = URLComponents(string: query.getURL) {
            urlComponents.query = query.getQuery
            
            guard let url = urlComponents.url else { return }
            
            task = defaultSession.dataTask(with: url, completionHandler: { [weak self] data, response, error in
                
                defer { self?.task = nil }
                
                if let error = error {
                    self?.error += "DataTask Error: " + error.localizedDescription + "\n"
                } else if
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    self?.updateWeatherData(data)
                    DispatchQueue.main.async {
                        completionHandler(self?.weatherParsedData, self?.error ?? "")
                    }
                }
            })
        }
        task?.resume()
    }
    
    private func updateWeatherData(_ weatherData: Data) {
        self.weatherParsedData = nil
        if let parsedData = parseJSON(weatherData) {
            self.weatherParsedData = parsedData
        } else {
            self.error += "Error in func updateWeatherData \n"
        }
    }
    
    private func parseJSON(_ data: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(WeatherData.self, from: data)
        } catch {
            self.error += "Parsing Error: " + error.localizedDescription + "\n"
            return nil
        }
        
    }
    
}

