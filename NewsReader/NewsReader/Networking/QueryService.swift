//
//  QeryService.swift
//  NewsReader
//
//  Created by Евгений Макеев on 09.02.2022.
//

import Foundation

class QueryService {
    private var parsedData: PostData?
    private let defaultSession = URLSession(configuration: .default)
    private var error: String = ""
    private var task: URLSessionDataTask?
    
    let url = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    func getQuery(callback: @escaping (PostData?, String) -> Void) {
        error = ""
        guard let url = URL(string: url) else { return callback(nil, "url error") }
        task = defaultSession.dataTask(with: url, completionHandler: { [weak self] data, response, error in
            defer { self?.task = nil }
            guard error == nil else {
                self?.error += "DataTask Error: \(error!.localizedDescription)\n"
                return
            }
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200
            else {
                self?.error += "Response Error \n"
                return
            }
            self?.updateParsedData(data)
            DispatchQueue.main.sync {
                callback(self?.parsedData, self?.error ?? "")
            }
        })
        task?.resume()
    }
    
    private func updateParsedData(_ rawJSONData: Data) {
        let decoder = JSONDecoder()
        do { self.parsedData = try decoder.decode(PostData.self, from: rawJSONData) }
        catch {
            self.error += "Parsing Error: \(error.localizedDescription)\n"
            self.parsedData = nil
        }
    }
}
