//
//  QueryService.swift
//  ByteCoin
//
//  Created by Евгений Макеев on 20.01.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

class QueryService {
    private var parsedData: CurrencyData?
    private let defaultSession = URLSession(configuration: .default)
    private var error: String = ""
    private var task: URLSessionDataTask?
    
    let url = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    func getSearchResults(completionHandler: @escaping (CurrencyData?, String) -> Void) {
        self.error = ""
        if let url = URL(string: self.url) {
            task = defaultSession.dataTask(with: url, completionHandler: { [weak self] data, response, error in
                
                defer { self?.task = nil }
                
                if let error = error {
                    self?.error += "DataTask Error: " + error.localizedDescription + "\n"
                } else if
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    self?.updateCurrencyData(data)
                    DispatchQueue.main.async {
                        completionHandler(self?.parsedData, self?.error ?? "")
                    }
                }
            })
            task?.resume()
        }
    }
    
    private func updateCurrencyData(_ currencyData: Data) {
        self.parsedData = nil
        if let parsedData = parseJSON(currencyData) {
            self.parsedData = parsedData
        } else {
            self.error += "Error in func updateCurrencyData \n"
        }
    }
    
    private func parseJSON(_ data: Data) -> CurrencyData? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(CurrencyData.self, from: data)
        } catch {
            self.error += "Parsing Error: " + error.localizedDescription + "\n"
            return nil
        }
    }
}
